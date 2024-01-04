{
  "properties" : { },
  "id" : "64ba47c2a11346e1972c63245cbf962c",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "修改登录状态",
  "createTime" : null,
  "updateTime" : 1703864506572,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/change/status",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "user:change:status",
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
import cn.dev33.satoken.stp.StpUtil
return db.table("sys_user").column("status", status).where().eq("id",id).ne("id", StpUtil.getLoginId()).update()