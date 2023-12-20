{
  "properties" : { },
  "id" : "841d87210c904f62b8ab27226d8d8a70",
  "script" : null,
  "groupId" : "c7ce65f5b3cf4aaa913f6fec7d35d176",
  "name" : "字典值列表",
  "createTime" : null,
  "updateTime" : 1703085061111,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/children/{value}",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 400,\n    \"data\": null,\n    \"message\": \"字典编码不能为空\"\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
return db.select("""
    select a.label, a.value, a.data_type, a.ext_json 
    from sys_dict a, sys_dict b 
    where b.value = #{path.value} and b.is_del = 0 and b.status = 0 and a.pid = b.id and a.is_del = 0 and a.status = 0 
    order by a.sort
""")