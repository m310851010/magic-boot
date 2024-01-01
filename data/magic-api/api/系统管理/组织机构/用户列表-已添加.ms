{
  "properties" : { },
  "id" : "copy1704109887559d28232",
  "script" : null,
  "groupId" : "8295fc13678d4144bf7363c465247a50",
  "name" : "用户列表-已添加",
  "createTime" : null,
  "updateTime" : 1704112746585,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/selected/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "office:user:list",
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
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
assert body.id : 0 , '参数不能为空'

return db.page("""
    select
        distinct su.id,
        su.username,
        su.name,
        su.is_login,
        su.phone,
        su.create_date,
        su.head_portrait,
        so.name office_name
    from sys_user su
    LEFT JOIN sys_office so on su.office_id = so.id
    where so.id = #{body.id} and su.is_del = 0
    ?{body?.username, and su.username like concat('%',#{body.username},'%')}
    ?{body?.name, and su.name like concat('%',#{body.name},'%')}
    ?{body?.phone, and su.phone like concat('%',#{body.phone},'%')}
    order by ${body?.orderBy || 'su.create_date desc'}
""")