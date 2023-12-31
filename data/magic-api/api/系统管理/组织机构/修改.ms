{
  "properties" : { },
  "id" : "copy1703954527217d86833",
  "script" : null,
  "groupId" : "8295fc13678d4144bf7363c465247a50",
  "name" : "修改",
  "createTime" : null,
  "updateTime" : 1704001037482,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/update",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "office:update",
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

assert body: 0, '参数错误'
assert body.id: 0, 'id参数错误'
assert body.name && body.name.length() < 64: 0, '名称参数错误'
assert body.type == 1 || body.type == 2: 0, '类型参数错误'
assert body.status == 0 || body.status == 1: 0, '状态参数错误'

var pid = body.pid || '0'
var office = {
    id: body.id,
    name: body.name,
    type: body.type,
    pid,
    status: body.status,
    leader: body.leader,
    phone: body.phone,
    email: body.email,
    sort: body.sort
}

var row = db.select("select code, pid from sys_office where is_del = 0 and id = #{body.id}")
assert row: 0, '部门不存在或已被删除'

// 父节点有变更,需要更新所有子节点的编码
if (row.pid != pid) {
    var children = db.select("select id, code from sys_office where is_del = 0 and code like '${row.code}%' order by code")
    if (children.length) {
        var maxCode = db.selectValue("select max(code) from sys_office where is_del = 0 and pid = #{pid}")
        var nextCode = maxCode ? Base36Utils.nextCode(maxCode) : (db.selectValue("select code from sys_office where is_del = 0 and id = #{pid}") + '00')
        var length = row.code.length()

        // 当前部门使用新的code
        office.code = nextCode

        var list = children.map(v => [nextCode + v.code.substring(length), v.id].toArray())
        // 批量更新所有子节点
        db.batchUpdate("""
            update sys_office set code=? where id = ?
        """, list)
    }
}

return db.table("sys_office").primary("id").update(office);