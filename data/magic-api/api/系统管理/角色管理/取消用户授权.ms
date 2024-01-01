{
  "properties" : { },
  "id" : "copy1703698953157d82677",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "取消用户授权",
  "createTime" : null,
  "updateTime" : 1704106952425,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/cancel/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:user:cancel",
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
  "requestBody" : "",
  "headers" : [ {
    "name" : "Authorization",
    "value" : "wD_HapzmES6TWMawn_MV4nqZARuIGmo6Nr__",
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
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 200,\n    \"data\": 1,\n    \"message\": \"success\"\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
import org.ssssssss.magicapi.modules.db.cache.SqlCache

assert body: 0, '参数错误'
assert body.id: 0, '请先选择一个角色'
assert (body.users && body.users.length > 0): 0, '请选择要取消授权的用户'

var id = body.id
var users = body.users

// 查询角色
var userCount = db.selectInt("select count(1) from sys_role where id = #{id}")
assert userCount: 0, '角色不存在或已被删除'


var list = users.map(user_id => [user_id, id].toArray())
db.batchUpdate("""
    delete from sys_user_role where user_id = ? and role_id = ?
""", list)

// 清除缓存
for (userId in users) {
    SqlCache.delete(`permissions:${userId}`)
}

return true;