{
  "properties" : { },
  "id" : "ebe40a0cf4b84192b6bbe923a0ecbd9c",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "个人信息修改",
  "createTime" : null,
  "updateTime" : 1704364825412,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/center/update",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "{\r\n\t\r\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================

assert body?.id : 0, '用户id不能为空'

var id = body.id;
var user = {
    id,
    name: body.name,
    phone: body.phone
}

var id = db.table("sys_user").primary("id").update(user)

return true;