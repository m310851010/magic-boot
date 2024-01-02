{
  "properties" : { },
  "id" : "46d45f15b5ab4de7b6718fd0c9b05e7b",
  "script" : null,
  "groupId" : "c7ce65f5b3cf4aaa913f6fec7d35d176",
  "name" : "删除",
  "createTime" : null,
  "updateTime" : 1704171993717,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "dict:delete",
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
  "responseBody" : null,
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
  "responseBodyDefinition" : null
}
================================
if (pid == '0'){
    db.table("sys_dict").logic().where().eq("pid",id).delete()
}

var ids = id.split(',')
return db.table("sys_dict").logic().where().in('id',ids).eq('pid', pid).delete()