{
  "properties" : { },
  "id" : "be89865140ab409085db6d0cc6d82452",
  "script" : null,
  "groupId" : "1952f25c81084e24b55b11385767dc38",
  "name" : "验证码",
  "createTime" : null,
  "updateTime" : 1701797132031,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/verification/code",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "require_login",
    "value" : "false",
    "description" : "该接口需要登录才允许访问",
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
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": {\n        \"img\": \"iVBORw0KGgoAAAANSUhEUgAAAGQAAAAwCAYAAADn/d+1AAAES0lEQVR4Xu2aS2wbRRjHw0tUcEARjwgJ8VQBIUBCPVSoF+DAAYQQlwrEDZAgopcipAhOuVJV4thbVVWih3KoemiJhBTxyDvNq0n8iJ9JnNjO047j2N6192O/sXa9+603azteZzbMT/or8sz4MPNzZr5ZuwsEXNFFGwTHixDCGUIIZwghnPG/EqLICsT60lAIlWC5fwNmz8bokGPnRApRNmRQkpIl5fsHEP0oBvef8sNct49l8eUgLPQEIHQ6CJWBrDl3MlC+tlU38uUUyL8krfk5AfLFVUuk75ZB+iJqzfkIlN4P6jEJsZuIEihAZSZvzei+dRLHNJGTki7aIHK8EUI4ixDCWYQQziKEcBYhhLOcSCFYElvKZIxaQmMpvfVOkKX4TfU1K7lpGY5RS/ToS36W7A8JU/mOpb2l3MfgVYBeD9Tg1cFyncCoVw0jJiFOEzFmt3cB1i+MQbxvyBRtIvT+4fZEmmHqjQgMPeBjQcp7FUhe2SGjquTni2yc79NV2uUKLd3UK0oZxpbuwsDMdfhz7gb7q8ULTDy3pAuRUjJk/srD5AshmH8vDhPPLtHhDBxr19dOWhJSlA50AYPzNyGT3/SclNEnAmyRdwf2YfhRvy4IM3LKD5PPhyDweYK+zXWaFpLYDjMJ2uKX5AJrNwppl5Rzv992TKsMP1wTMPZk0CTEmJ27OfpWV2layGiwulVhpiKDpr52CqELb5ejMPJ49b8EE7mQhNkzUdj4LWuRgukUTQvRFvwf3y1IZZbr9rVDCl34w9Iq4z21s2T+gzioRyOjtCaDIikg75b1/sWPV9hrt2laCIKLrSgKbWa0U4rbTL0arm1Nf6hbU50pZf/NQ7g3ycZMvxWh3W2nJSHrOzHapOMlIYgmxOnTr5055WyFdtXl5unXaVNDtCTECS9Jwa2okXNi+/YeDD1UHRc471x9oRAtzeCKEMQrQuI/pXUhlbzzp18bmxs/oF0WjFIaldMRIbxLYZ9+dZHxVu5E6Ot1XUrk+yTtNkFl0NRDCFFRSop+F1np36TdJrJ/53Uh0282dshTEXZBXBOCeEkKgos8/kyQNpswlsJj3YePrQeVQOOqEMRLUmI/pthCSxuHV1z4cyJNylGgMoQQQjlXgckXQ2yhFz5ctj3kpbSsCxl+xE+7W6YjQhAvSUH0M+Jt+zNi506uusX1tPcJcEeEIF4Ssj9dgPGnq4d8+noGinGJDgH/Z6u6OHzs0i6EEBsOAiWYezemL3qlqEA5U9vC0ld39b7EpS3DO60YzwgnOirEcyi17UsLPtta+kq9izxYaxt5zPkcoYe3nZyOCfEqW7f2IPhlwiLGmLVft9lBfxhURr0gQkiD3HslZPr+xBjfJyt0uC1UAo0Q0iT49e7Ua2EIf7sOuXsFiF5MVb9HqfPo3gkqQwjhDCGEQ4QQzhBCOEMI4QwhhDOEEM4QQjhDCOEMIYQzhBDO+A+gJROul5EKkgAAAABJRU5ErkJggg==\",\n        \"uuid\": \"7eeb2c4fe7d64a1da48b54aea3839882\"\n    },\n    \"timestamp\": 1701796976037,\n    \"executeTime\": 6\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
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
    "children" : [ {
      "name" : "code",
      "value" : "200",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ {
        "name" : "img",
        "value" : "data:image/png;base64,[B@65617f6d",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      }, {
        "name" : "uuid",
        "value" : "9a080e570e0346bf8b80c035c977c888",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      } ]
    }, {
      "name" : "timestamp",
      "value" : "1647333558240",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "15",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
import cn.hutool.captcha.LineCaptcha
import cn.hutool.captcha.CaptchaUtil
import cn.hutool.captcha.generator.MathGenerator
import log
import java.io.ByteArrayOutputStream
import java.io.OutputStream
import org.ssssssss.magicboot.model.CodeCacheMap

LineCaptcha lineCaptcha = CaptchaUtil.createShearCaptcha(240, 48, 4, 10);
lineCaptcha.setGenerator(new MathGenerator(1));
var uuid = UUID.randomUUID().toString().replace('-', '')
CodeCacheMap.put(uuid, lineCaptcha.getCode())
OutputStream bOut = new ByteArrayOutputStream();
lineCaptcha.write(bOut)
var bytes = bOut.toByteArray()
return {
    img: bytes,
    uuid: uuid
}