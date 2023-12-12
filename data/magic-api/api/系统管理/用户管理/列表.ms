{
  "properties" : { },
  "id" : "4399f2eb199b46448aa98682fe792667",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "列表",
  "createTime" : null,
  "updateTime" : 1702396038864,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "user:view",
    "description" : "允许拥有该权限的访问",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "requestBody" : "{\n\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 402,\n    \"message\": \"凭证已过期\",\n    \"data\": null,\n    \"timestamp\": 1643964929030,\n    \"executeTime\": null\n}",
  "description" : null,
  "requestBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ ]
  },
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "402",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "凭证已过期",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "null",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1643964929030",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "null",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
var page = db.page("""
    select
        su.id,
        su.username,
        su.name,
        su.is_login,
        su.phone,
        su.create_date,
        su.office_id,
        su.head_portrait,
        so.name office_name
    from sys_user su
    left join sys_office so on su.office_id = so.id
    ?{body?.roles, left join sys_user_role sur on su.id = sur.user_id}
    where su.is_del = 0
    ?{body?.officeCode, and so.code like concat(#{body.officeCode},'%')}
    ?{body?.roles, and sur.role_id in(#{body.roles})}
    ?{body?.username, and su.username like concat('%',#{body.username},'%')}
    ?{body?.name, and su.name like concat('%',#{body.name},'%')}
    ?{body?.isLogin, and su.is_login = #{body.isLogin}}
    order by ${body?.orderBy || 'su.create_date desc'}
""")

if (!page.list){
    return page;
}

var userIds = page.list.map(v => v.id)

var roles = db.select("""
select sr.name, sr.id, sur.user_id from sys_role sr left join sys_user_role sur on sr.id = sur.role_id 
    where sr.is_del = 0 and sur.user_id in (#{userIds})
    ?{body?.roles, and sur.role_id in(#{body.roles})}
""")

var roleNameMap = roles.group(it => it.userId, list => list.map(v => v.name))
var roleIdMap = roles.group(it => it.userId, list => list.map(v => v.id))

for (item in page.list) {
    item.roleNames = roleNameMap[item.id]
    item.roles = roleIdMap[item.id]
}

return page