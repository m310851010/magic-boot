{
  "properties" : { },
  "id" : "copy1702396672171d75276",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "修改当前用户密码",
  "createTime" : null,
  "updateTime" : 1704296124483,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/update-password",
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
import cn.hutool.crypto.SmUtil
import cn.dev33.satoken.stp.StpUtil
import cn.hutool.core.util.RandomUtil;

assert body?.password : 0, '原密码不能为空'
assert body?.newPassword : 0, '新密码不能为空'


var user = db.selectOne("""
    select password, salt from sys_user where id = #{StpUtil.getLoginId()}
""")


assert SmUtil.sm3WithSalt(user.salt.getBytes()).digestHex(body.password) == user.password : 0, '原密码不正确！'

var salt = RandomUtil.randomStringUpper(20);
var data = {
    id: StpUtil.getLoginId(),
    salt,
    password: SmUtil.sm3WithSalt(salt.getBytes()).digestHex(body.newPassword)
}

return db.table('sys_user').primary('id').update(data, true)
