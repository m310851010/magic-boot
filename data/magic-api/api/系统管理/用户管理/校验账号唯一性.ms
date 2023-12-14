{
  "properties" : { },
  "id" : "cf92fefbe35d4b9fbe2320bd9ba7bca7",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "校验账号唯一性",
  "createTime" : null,
  "updateTime" : 1702546922596,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "unique",
  "method" : "GET",
  "parameters" : [ {
    "name" : "username",
    "value" : "admin",
    "description" : null,
    "required" : true,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : "账号不能为空",
    "expression" : null,
    "children" : null
  } ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ {
    "name" : "Authorization",
    "value" : "GD_ogvyhisu26bEqc_0rfK8A2BnpLVWbXM__",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 200,\n    \"data\": false,\n    \"message\": \"success\"\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
return !db.selectInt('select count(1) from sys_user where is_del = 0 and username = #{username}');
