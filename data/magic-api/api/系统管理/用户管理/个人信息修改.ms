{
  "properties" : { },
  "id" : "ebe40a0cf4b84192b6bbe923a0ecbd9c",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "个人信息修改",
  "createTime" : null,
  "updateTime" : 1702312129263,
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
import cn.hutool.crypto.SmUtil

assert password : 0, '原密码不能为空'
assert newPassword : 0, '新密码不能为空'

var user = db.selectValue("""
    select password, salt from sys_user where id = #{id}
""")

if(user.password != SmUtil.sm3WithSalt(user.salt.getBytes()).digestHex(password)){
    exit 0, '原密码不正确！'
}

var data = {
    id,
    phone,
    headPortrait,
    password: SmUtil.sm3WithSalt(user.salt.getBytes()).digestHex(newPassword)
}

return db.table('sys_user').primary('id').update(data, true)
