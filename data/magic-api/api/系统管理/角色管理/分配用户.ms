{
  "properties" : { },
  "id" : "copy1703574237992d50093",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "分配用户",
  "createTime" : null,
  "updateTime" : 1703589494167,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:users",
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
import '@get:/system/role/cache/delete' as cacheDelete
var id = body.id;
assert id: 0, '请先选择一个角色'

// 查询角色
var role = db.table("sys_role").primary("id").where().eq('is_del', 0).selectOne();
assert role?.id: 0, '角色不存在或已被删除'

// 删除用户-角色关系
db.table("sys_user_role").where().eq("role_id",id).delete()
// 批量插入角色-菜单关系
if (body.users && body.users.length){
    var list = body.users.map(user_id => ({ role_id: id, user_id }))
    db.table('sys_user_role').batchInsert(list)
}

// 先删除数据库 后删除缓存 不然拦截器会请求查询数据库 查到的还是老数据
var roleId = id
cacheDelete()

return true;