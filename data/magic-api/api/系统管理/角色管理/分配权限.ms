{
  "properties" : { },
  "id" : "328404846ec94cef9223b630d46b349b",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "分配权限",
  "createTime" : null,
  "updateTime" : 1703589489400,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/permission",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:permission",
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

// 更新角色
var row = db.table("sys_role").primary("id").where().eq('is_del', 0).update({id, permission: body.permission}, true)
assert (row > 0): 0, '角色不存在或已被删除'

// 删除角色-菜单关系
db.table("sys_role_menu").where().eq("role_id",id).delete()
// 批量插入角色-菜单关系
if (body.menus && body.menus.length){
    var list = body.menus.map(menu_id => ({ role_id: id, menu_id }))
    db.table('sys_role_menu').batchInsert(list)
}

// 删除角色-部门关系
db.table("sys_role_office").where().eq("role_id", id).delete()

// 自定义数据权限, 批量插入角色-部门关系
if (body.permission == 1 && body.offices && body.offices.length){
    var list = body.offices.map(office_id => ({ role_id: id, office_id }))
    db.table('sys_role_office').batchInsert(list)
}

// 先删除数据库 后删除缓存 不然拦截器会请求查询数据库 查到的还是老数据
var roleId = id
cacheDelete()

return true;