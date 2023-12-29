{
  "properties" : { },
  "id" : "bd6f73f10561440a92a203f0ff70e6ae",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "查询角色关联的组织机构",
  "createTime" : null,
  "updateTime" : 1703863781810,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "office/list",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:office:list",
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
return db.select("""
    select office_id as id from sys_role_office where role_id = #{roleId}
""").map(it => it.id)