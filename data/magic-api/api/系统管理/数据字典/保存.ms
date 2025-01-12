{
  "properties" : { },
  "id" : "cbf24a795f6441d6af123d6dff065e37",
  "script" : null,
  "groupId" : "c7ce65f5b3cf4aaa913f6fec7d35d176",
  "name" : "保存",
  "createTime" : null,
  "updateTime" : 1736600273385,
  "lock" : "0",
  "createBy" : null,
  "updateBy" : null,
  "path" : "/save",
  "method" : "POST",
  "parameters" : [ ],
  "options" : [ {
    "name" : "permission",
    "value" : "dict:save",
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
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : null
}
================================
assert body : 0, '参数错误'
assert body.pid : 0, '参数错误'
assert body.label : 0, '字典名称不能为空'
assert not_null(body.value) : 0, '字典值不能为空'

if (body.pid == '0'){
    assert [0, 1, 2, 3, 4].some(e => e == body.dataType) : 0, '数据类型错误'
    assert body.dictType == 0 || body.dictType == 1  : 0, '字典类型错误'
}

var valueCount = db.selectInt("""
select count(1) from sys_dict where is_del = 0 and pid = #{body.pid} and value = #{body.value} ?{body.id, and id != #{body.id}}
""")
assert !valueCount : 0, '字典值已存在'

var dic = {
    id: body.id,
    label: body.label,
    pid: body.pid,
    sort: body.sort,
    status: body.status,
    value: body.value,
    remark: body.remark,
    extJson: body.extJson
};

if (body.pid == '0'){
    dic.dataType = body.dataType;
    dic.dictType = body.dictType;
}

return db.table("sys_dict").primary("id").withBlank().saveOrUpdate(dic)