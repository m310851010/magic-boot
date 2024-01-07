{
  "properties" : { },
  "id" : "cc20896df1c546fba56929cc75cb0309",
  "script" : null,
  "groupId" : "fd3d225a1cf141bf9998c4ec4bf4a6ab",
  "name" : "上传",
  "createTime" : null,
  "updateTime" : 1704644958840,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/upload",
  "method" : "POST",
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
import org.ssssssss.magicboot.utils.FileUtils
import cn.hutool.core.img.ImgUtil;
import request;

println('=======')
println(body)

var map;
var bizIdValue;

if (not_blank(body.file) && not_blank(body.filename)) {
     assert body.bizType : 0, '参数为空'
    var image = ImgUtil.toImage(body.file);
    map = FileUtils.saveImage(image, body.filename, 'png', body.bizType);
    bizIdValue = body.bizId
} else {
    var file = request.getFile('file');
    assert file : 0, '参数为空'
    assert bizType : 0, '参数为空'
    map = FileUtils.saveFile(file, bizType);
    bizIdValue = bizId
}

println(map)

if (map.success){
    db.table("sys_file").primary("id").saveOrUpdate({
        url: map.url,
        original: map.original,
        size: map.size,
        suffix: map.suffix,
        url: map.url,
        bizType: map.bizType,
        bizId: bizIdValue,
        storagePath: map.storagePath,
        engine: map.engine,

    })

    return map.url;
} 

exit 0, map.message;