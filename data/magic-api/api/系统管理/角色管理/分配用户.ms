{
  "properties" : { },
  "id" : "copy1703574237992d50093",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "分配用户",
  "createTime" : null,
  "updateTime" : 1703700637676,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/allocate/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:user:allocate",
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
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : null,
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
import org.ssssssss.magicapi.modules.db.cache.SqlCache

var id = body?.id;
assert id: 0, '请先选择一个角色'
assert body.users?.length: 0, '请选择要分配的用户'


// 查询角色
var userCount = db.selectInt("select count(1) from sys_role where id = #{id}")
assert userCount : 0, '角色不存在或已被删除'

// 批量插入角色-菜单关系
var list = body.users.map(user_id => ({ role_id: id, user_id }))
db.table('sys_user_role').batchInsert(list)

// 清除缓存
for(userId in body.users){
    SqlCache.delete(`permissions:${userId}`)
}

return true;