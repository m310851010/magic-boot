{
  "properties" : { },
  "id" : "copy1703686490652d31638",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "用户列表-未分配",
  "createTime" : null,
  "updateTime" : 1704110449446,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/unallocated/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:user:unallocated",
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
    LEFT JOIN sys_user_role sur on su.id = sur.user_id
    LEFT JOIN sys_office so on su.office_id = so.id
    LEFT JOIN sys_role r ON r.id = sur.role_id 
    LEFT JOIN (
        SELECT
            u.id as user_id 
        FROM
            sys_user u
            INNER JOIN sys_user_role ur ON u.id = ur.user_id 
        WHERE
            ur.role_id = #{body.id}
    ) t ON su.id = t.user_id
    where su.is_del = 0
    AND ( r.id != #{body.id} OR r.id IS NULL) 
    AND t.user_id IS NULL
    ?{body?.username, and su.username like concat('%',#{body.username},'%')}
    ?{body?.name, and su.name like concat('%',#{body.name},'%')}
    ?{body?.phone, and su.phone like concat('%',#{body.phone},'%')}
    order by ${body?.orderBy || 'su.create_date desc'}
""")
