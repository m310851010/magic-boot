{
  "properties" : { },
  "id" : "633b78b93bba43fba785c71c1c18d7f7",
  "script" : null,
  "groupId" : "89130d496f6f467c88b22ae4a7f688eb",
  "name" : "删除",
  "createTime" : null,
  "updateTime" : 1703703737686,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/delete",
  "method" : "DELETE",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "role:delete",
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
  "requestBody" : "{\n\n}",
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
import '@get:/system/role/cache/delete' as cacheDelete
assert id: 0, '请先选择一个角色'

var userCount = db.selectInt("select count(1) from sys_user_role where role_id = #{id}")
assert (userCount <= 0) : 0, '该角色已分配给用户,请取消全部用户后再删除'

db.table("sys_role_menu").where().eq("role_id",id).delete()
db.table("sys_role_office").where().eq("role_id",id).delete()
var result = db.table("sys_role").logic().where().eq("id",id).delete();

var roleId = id
cacheDelete()
return result