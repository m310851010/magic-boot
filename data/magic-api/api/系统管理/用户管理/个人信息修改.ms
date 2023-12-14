{
  "properties" : { },
  "id" : "ebe40a0cf4b84192b6bbe923a0ecbd9c",
  "script" : null,
  "groupId" : "4f0230049d7e4f39b1e0897cc0f46f9a",
  "name" : "个人信息修改",
  "createTime" : null,
  "updateTime" : 1702559132014,
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
import cn.dev33.satoken.secure.SaSecureUtil;
import org.ssssssss.magicapi.modules.db.cache.SqlCache
import cn.hutool.crypto.SmUtil
import cn.hutool.core.util.RandomUtil;
import env;

assert body.id : 0, '用户id不能为空'
assert body.id != '1' : 0, '超级管理员不能修改'

var id = body.id;
var user = {
    id,
    name: body.name,
    phone: body.phone,
    officeId: body.officeId,
    isLogin: body.isLogin
}

SqlCache.delete(`permissions:${id}`)
db.update("""
    delete from sys_user_role where user_id = #{id}
""")

var id = db.table("sys_user").primary("id").saveOrUpdate(user)
if (body.roles){
    var list = body.roles.map(role_id => ({ user_id : id, role_id }))
    db.table('sys_user_role').batchInsert(list)
}

return true;