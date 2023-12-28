{
  "properties" : { },
  "id" : "34be68a90e9c4596bb2aebef667839ed",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "查询角色关联的菜单",
  "createTime" : null,
  "updateTime" : 1703767138037,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/menu/list",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:menu:list",
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
assert roleId : 0, '参数为空'
return db.select("""
    select menu_id as id from sys_role_menu where role_id = #{roleId}
""").map(it => it.id)