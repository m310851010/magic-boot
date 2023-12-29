{
  "properties" : { },
  "id" : "df96c27b543a45cdabaa33515ca748e3",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "获取角色列表-用户",
  "createTime" : null,
  "updateTime" : 1703863686089,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/role/list",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "user:role:list",
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
import '@get:/system/role/all' as roleList
return roleList()