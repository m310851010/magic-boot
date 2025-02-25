{
  "properties" : { },
  "id" : "d6d05df1e8b14a6ebc270113b2cdd1ed",
  "script" : null,
  "groupId" : "67b2ce258e24491194b74992958c74aa",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1704206639143,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "wrap_request_parameter",
    "value" : "data",
    "description" : "包装请求参数到一个变量中",
    "required" : false,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  }, {
    "name" : "permission",
    "value" : "menu:save",
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
  "requestBody" : "{}",
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
import org.ssssssss.magicapi.modules.db.cache.SqlCache;
import '@get:/system/menu/cache/delete' as cacheDelete;

assert body: 0, '参数错误'
assert body.menuType: 0, '菜单类型不能为空'
assert body.name: 0, '菜单名称不能为空'

if (!body.pid) {
    body.pid = '0'
}

var menu = {
    id: body.id,
    name: body.name,
    pid: body.pid,
    sort: body.sort,
    remark: body.remark,
    isShow: body.isShow,
    menuType: body.menuType,
    icon: body.icon,
    permission: body.permission,
    componentName: body.componentName,
    url: body.url,
    frame: body.frame,
    openMode: body.openMode
}

var result = db.table("sys_menu").primary("id").withBlank().saveOrUpdate(menu);

SqlCache.delete('permissions:1')
if (data.id) {
    var menuId = data.id
    cacheDelete();
}
return result