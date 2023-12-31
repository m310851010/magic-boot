{
  "properties" : { },
  "id" : "e6e93739948244aeb8c5c6a131419035",
  "script" : null,
  "groupId" : "8295fc13678d4144bf7363c465247a50",
  "name" : "内部树结构",
  "createTime" : null,
  "updateTime" : 1704095445273,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/inner/tree",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "inner:office/tree",
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
var toTree = (list, pid) => select t.*, toTree(list, t.key) children from list t where t.pid = pid
return toTree(db.select("""
select id, id as 'key', name as title, code, pid from sys_office where is_del = 0 order by sort
"""),'0')