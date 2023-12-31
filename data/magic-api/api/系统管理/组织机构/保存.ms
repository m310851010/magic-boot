{
  "properties" : { },
  "id" : "03c2c9614e5b47f48f61f4f7759fe353",
  "script" : null,
  "groupId" : "8295fc13678d4144bf7363c465247a50",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1703996753157,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "office:save",
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
import org.ssssssss.magicboot.utils.Base36Utils

assert body : 0, '参数错误'
assert body.name && body.name.length() < 64 : 0, '名称参数错误'
assert body.type == 1 || body.type == 2 : 0, '类型参数错误'
assert body.status == 0 || body.status == 1 : 0, '状态参数错误'

var pid = body.pid || '0'
var office = {
    name: body.name,
    type: body.type,
    pid,
    status: body.status,
    leader: body.leader,
    phone: body.phone,
    email: body.email,
    sort: body.sort
}

var maxCode = db.selectValue("select max(code) from sys_office where is_del = 0 and pid = #{pid}")

var code = ''
if (maxCode) {
    code = Base36Utils.nextCode(maxCode)
} else {
    pCode = db.selectValue("select code from sys_office where is_del = 0 and id = #{pid}")
    code = pCode + '00';
}

office.code = code

return db.table("sys_office").primary("id").saveOrUpdate(office);