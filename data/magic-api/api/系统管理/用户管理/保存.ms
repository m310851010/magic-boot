{
  "properties" : { },
  "id" : "877918736c764253a85d0780cbd5f763",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1704372649274,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "user:save",
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
  "requestBody" : "{\n}",
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
import cn.dev33.satoken.secure.SaSecureUtil;
import org.ssssssss.magicapi.modules.db.cache.SqlCache
import cn.hutool.crypto.SmUtil
import cn.hutool.core.util.RandomUtil;
import env;


assert body.username : 0, '账号不能为空'
assert (/^\w{3,64}$/.test(body.username)) :  0, '账号必须是长度在3~64位之间的数字、字母的组合'

var usernameCount = db.selectInt("select count(1) from sys_user where is_del = 0 and username = #{body.username}")
assert (usernameCount == 0) : 0, '该账号已存在，请重新输入'

if (!body.password){
    body.password = env.get('default-password');
}

var salt = RandomUtil.randomStringUpper(20);
var password = SmUtil.sm3WithSalt(salt.getBytes()).digestHex(SmUtil.sm3(body.password))
var user = {
    name: body.name,
    username: body.username,
    phone: body.phone,
    email: body.email,
    sex: body.sex,
    nickName: body.nickName,
    status: body.status,
    officeId: body.officeId,
    salt,
    password
}

var id = db.table("sys_user").primary("id").saveOrUpdate(user)
if (body.roles){
    var list = body.roles.map(role_id => ({ user_id : id, role_id }))
    db.table('sys_user_role').batchInsert(list)
}

return true
