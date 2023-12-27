{
  "properties" : { },
  "id" : "copy1703698953157d82677",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "取消用户授权",
  "createTime" : null,
  "updateTime" : 1703702873205,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/cancel/users",
  "method" : "DELETE",
  "parameters" : [ {
    "name" : "id",
    "value" : "1739546261423525888",
    "description" : null,
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "users",
    "value" : "1740056466313842688,7e7f4b1017fc4564ad31a05033eb29d1",
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

assert id: 0, '请先选择一个角色'
assert users: 0, '请选择要取消授权的用户'

var userIds = users.split(',')

// 查询角色
var userCount = db.selectInt("select count(1) from sys_role where id = #{id}")
assert userCount: 0, '角色不存在或已被删除'


var list = Arrays.asList(userIds.map(user_id => [user_id, id].toArray()))
db.batchUpdate("""
    delete from sys_user_role where user_id = ? and role_id = ?
""", list)

// 清除缓存
for (userId in userIds) {
    SqlCache.delete(`permissions:${userId}`)
}

return true;