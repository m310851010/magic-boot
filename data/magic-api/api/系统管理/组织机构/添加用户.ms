{
  "properties" : { },
  "id" : "copy1704111703353d63988",
  "script" : null,
  "groupId" : "8295fc13678d4144bf7363c465247a50",
  "name" : "添加用户",
  "createTime" : null,
  "updateTime" : 1704113248978,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/add/users",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "office:user:add",
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

var id = body?.id;
assert id: 0, '请先选择一个部门'
assert body.users?.length: 0, '请选择要添加的用户'


// 查询角色
var userCount = db.selectInt("select count(1) from sys_office where id = #{id}")
assert userCount : 0, '部门不存在或已被删除'

// 批量插入角色-菜单关系
var list = body.users.map(userId => [id, userId].toArray())
db.batchUpdate("""
    update sys_user set office_id = ? where id = ?
""", list)

return true;