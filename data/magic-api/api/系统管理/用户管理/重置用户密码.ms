{
  "properties" : { },
  "id" : "copy1702396996028d54725",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "重置用户密码",
  "createTime" : null,
  "updateTime" : 1702401194760,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/reset-password",
  "method" : "GET",
  "parameters" : [ {
    "name" : "id",
    "value" : null,
    "description" : null,
    "required" : true,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : "用户id不能为空",
    "expression" : null,
    "children" : null
  } ],
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
import cn.hutool.crypto.SmUtil
import cn.dev33.satoken.stp.StpUtil
import env;

var user = db.table('sys_user').column('salt').where().eq('id', id).selectOne()
assert user : 0, '用户不存在'

var defaultPassword = env.get('default-password');
var data = {
    id,
    password: SmUtil.sm3WithSalt(user.salt.getBytes()).digestHex(SmUtil.sm3(defaultPassword))
}

db.table('sys_user').primary('id').update(data, true)
return defaultPassword
