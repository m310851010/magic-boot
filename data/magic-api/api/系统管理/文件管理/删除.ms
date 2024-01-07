{
  "properties" : { },
  "id" : "a18a418e9d2a437dbdb51191340086c9",
  "script" : null,
  "groupId" : "fd3d225a1cf141bf9998c4ec4bf4a6ab",
  "name" : "删除",
  "createTime" : null,
  "updateTime" : 1704644356008,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
import org.ssssssss.magicboot.model.Global
import cn.hutool.core.io.FileUtil;

assert url : 0, '参数错误'
assert bizId : 0, '参数错误'
assert bizType : 0, '参数错误'

println('url==' + url)
println('bizId==' + bizId)
println('bizType==' + bizType)
var row = db.table("sys_file").where().eq("url",url).eq("biz_id", bizId).eq("biz_type", bizType).delete()
if (row > 0){
    FileUtil.del(Global.getUserFilesBaseDir() + url);
}

return !row;

