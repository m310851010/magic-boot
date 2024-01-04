{
  "properties" : { },
  "id" : "789b43739f4b4ad3a79e732d621f8783",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "用户列表-已分配",
  "createTime" : null,
  "updateTime" : 1704109774393,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/list/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:user:list",
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
        su.status,
        su.phone,
        su.create_date,
        su.avatar,
        so.name office_name
    from sys_user su
    inner join sys_user_role sur on su.id = sur.user_id
    left join sys_office so on su.office_id = so.id
    where sur.role_id = #{body.id} and su.is_del = 0
    ?{body?.username, and su.username like concat('%',#{body.username},'%')}
    ?{body?.name, and su.name like concat('%',#{body.name},'%')}
    ?{body?.phone, and su.phone like concat('%',#{body.phone},'%')}
    order by ${body?.orderBy || 'su.create_date desc'}
""")