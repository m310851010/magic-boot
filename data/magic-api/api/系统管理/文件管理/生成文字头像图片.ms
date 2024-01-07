{
  "properties" : { },
  "id" : "fdc3dfa147d543d9b5535b648b1196ca",
  "script" : null,
  "groupId" : "fd3d225a1cf141bf9998c4ec4bf4a6ab",
  "name" : "生成文字头像图片",
  "createTime" : null,
  "updateTime" : 1704599825836,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/avatar",
  "method" : "GET",
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
import org.ssssssss.magicboot.utils.ImageGenerator;
import java.awt.Color;
import response

assert text : 0, '参数错误'

if (text.length() > 2 ) {
    if (/[\u4e00-\u9fa5]+/.test(text)){
        text = text.substring(text.length() - 2);
    } else {
        text = text.substring(0, 2).toUpperCase();
    }
}

var image = ImageGenerator.createImageByText(text, 200, 200, Color.white, ImageGenerator.randomColor());
ImageGenerator.outputImage(image, response.getOutputStream())

return response.end()