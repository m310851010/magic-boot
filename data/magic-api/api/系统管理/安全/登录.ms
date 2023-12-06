{
  "properties" : { },
  "id" : "6f604c0abbe446b381381ae929026a28",
  "script" : null,
  "groupId" : "1952f25c81084e24b55b11385767dc38",
  "name" : "登录",
  "createTime" : null,
  "updateTime" : 1701801150769,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/login",
  "method" : "POST",
  "parameters" : [ {
    "name" : "username",
    "value" : null,
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : "admin",
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "password",
    "value" : null,
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : "59401f8481ae4476595f5346a41dcf81e44850ad919e6046f33cbdbe91029d3f",
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "code",
    "value" : null,
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
  "requestBody" : "{\r\n    \"username\": \"admin\",\r\n    \"password\": \"f0b2ea2fe3f5c347cc643f267bcd3f25f4d4fdc3cfb8b92e19cb09650e1e3f1b\"\r\n}",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": \"63aef477-f270-48ef-acb9-c52ee3c5440d\",\n    \"timestamp\": 1701800910095,\n    \"executeTime\": 54\n}",
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
    "children" : [ {
      "name" : "username",
      "value" : "admin",
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
      "name" : "password",
      "value" : "59401f8481ae4476595f5346a41dcf81e44850ad919e6046f33cbdbe91029d3f",
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
  },
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
      "value" : "63aef477-f270-48ef-acb9-c52ee3c5440d",
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
      "name" : "timestamp",
      "value" : "1701800910095",
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
      "value" : "54",
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
import org.ssssssss.magicboot.utils.AddressUtil
import log
import 'cn.dev33.satoken.stp.StpUtil';
import '@/configure/getBykey' as configure;
import request;
import org.ssssssss.magicboot.model.CodeCacheMap
import cn.hutool.http.useragent.UserAgentUtil
import cn.hutool.http.useragent.UserAgent
import cn.dev33.satoken.secure.SaSecureUtil
import cn.hutool.crypto.SmUtil
import java.nio.charset.StandardCharsets

UserAgent ua = UserAgentUtil.parse(request.getHeaders("User-Agent")[0])
if(configure('verification-code.enable') == 'true'){
    if(!body.code){
        exit 0, '请输入验证码'
    } else if(body.code != CodeCacheMap.get(body.uuid)){
        exit 0, '验证码错误'
    }
}

if(!body.username){
    exit 0, '请输入用户名'
}

if(!body.password){
    exit 0, '请输入密码'
}

var user = db.table("sys_user").where().eq("username",body.username).eq('is_del', 0).selectOne()

var loginLog = {
    id: nextId(),
    username: body.username,
    type: '成功',
    ip: request.getClientIP(),
    browser: ua.getBrowser().toString(),
    os: ua.getOs().toString(),
    address: AddressUtil.getAddress(request.getClientIP())
}

if(!user || SmUtil.sm3WithSalt(user.salt.getBytes()).digestHex(body.password) != user.password){
    loginLog.failPassword = body.password
    loginLog.type = '失败'
    db.table("sys_login_log").primary("id").save(loginLog);
    exit 0,'用户名或密码错误'
}

if(user.isLogin == '1'){
    exit 0, '此账号禁止登录'
}

StpUtil.login(user.id)
var token = StpUtil.getTokenValueByLoginId(user.id)
loginLog.token = token
db.table("sys_login_log").primary("id").save(loginLog);
CodeCacheMap.remove(body.uuid)
return StpUtil.getTokenValueByLoginId(user.id)
