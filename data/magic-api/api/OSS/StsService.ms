{
  "properties" : { },
  "id" : "83fdef23ec05468a87e2271170f15823",
  "script" : null,
  "groupId" : "a73658de49cc4c1683e807418e6a88ab",
  "name" : "StsService",
  "createTime" : null,
  "updateTime" : 1680320197000,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "/sts/service",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ {
    "name" : "require_login",
    "value" : "false",
    "description" : "该接口需要登录才允许访问",
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
  "responseBody" : "{\n    \"code\": 200,\n    \"message\": \"success\",\n    \"data\": {\n        \"accessKeyId\": \"STS.NV8kVN8NR9kcsWx2jPze3B4DQ\",\n        \"accessKeySecret\": \"6Sicvm1n2JhZLobWSDhA7ZLYtBNiX3K24sAiGxf9wndL\",\n        \"stsToken\": \"CAIS9AF1q6Ft5B2yfSjIr5WNIOz61ZFzjqmIcXHJ1moFduofrfHvszz2IHlIeHhrCOoct/g+lG1Y5vcelqJIRoReREvCUcZr8szhV9MP+NKT1fau5Jko1beHewHKeTOZsebWZ+LmNqC/Ht6md1HDkAJq3LL+bk/Mdle5MJqP+/UFB5ZtKWveVzddA8pMLQZPsdITMWCrVcygKRn3mGHdfiEK00he8TontPXmm5XHt0CH3AGimrEvyt6vcsT+Xa5FJ4xiVtq55utye5fa3TRYgxowr/4q0P0fqG2d543MUwQBs0TaKYjO+9hoNxRla7MmC1DqA1IBFWURGoABXu90o2TJtdJZbYegG+0pbMs78qGZppbfx2FsuWOntzD7S/DSOQyGvYkRzpGBFG191wsqLWirYafbpdnRGCW4r5uZ5MP6haf3+BZYTYcJ7jCUNZlkxLPJVrWkahQ2mTqNHR1g1/rug3hwhf5IkloBjMMEsWrHJlnwMI9xowY7XZI=\"\n    },\n    \"timestamp\": 1680242047286,\n    \"executeTime\": 907\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
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
    "children" : [ {
      "name" : "code",
      "value" : "200",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "",
      "description" : "",
      "required" : false,
      "dataType" : "Object",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ {
        "name" : "accessKeyId",
        "value" : "STS.NV8kVN8NR9kcsWx2jPze3B4DQ",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      }, {
        "name" : "accessKeySecret",
        "value" : "6Sicvm1n2JhZLobWSDhA7ZLYtBNiX3K24sAiGxf9wndL",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      }, {
        "name" : "stsToken",
        "value" : "CAIS9AF1q6Ft5B2yfSjIr5WNIOz61ZFzjqmIcXHJ1moFduofrfHvszz2IHlIeHhrCOoct/g+lG1Y5vcelqJIRoReREvCUcZr8szhV9MP+NKT1fau5Jko1beHewHKeTOZsebWZ+LmNqC/Ht6md1HDkAJq3LL+bk/Mdle5MJqP+/UFB5ZtKWveVzddA8pMLQZPsdITMWCrVcygKRn3mGHdfiEK00he8TontPXmm5XHt0CH3AGimrEvyt6vcsT+Xa5FJ4xiVtq55utye5fa3TRYgxowr/4q0P0fqG2d543MUwQBs0TaKYjO+9hoNxRla7MmC1DqA1IBFWURGoABXu90o2TJtdJZbYegG+0pbMs78qGZppbfx2FsuWOntzD7S/DSOQyGvYkRzpGBFG191wsqLWirYafbpdnRGCW4r5uZ5MP6haf3+BZYTYcJ7jCUNZlkxLPJVrWkahQ2mTqNHR1g1/rug3hwhf5IkloBjMMEsWrHJlnwMI9xowY7XZI=",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      } ]
    }, {
      "name" : "timestamp",
      "value" : "1680242047286",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "907",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.auth.sts.AssumeRoleRequest;
import com.aliyuncs.auth.sts.AssumeRoleResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import response
import env

if(env.get('oss.enable') == 'false'){
    exit 500, '使用oss上传组件前请先配置oss信息'
}

// STS接入地址，例如sts.cn-hangzhou.aliyuncs.com。
String endpoint = env.get("oss.endpoint");
// 填写步骤1生成的访问密钥AccessKey ID和AccessKey Secret。
String accessKeyId = env.get("oss.accessKeyId");
String accessKeySecret = env.get("oss.accessKeySecret");
// 填写步骤3获取的角色ARN。
String roleArn = env.get("oss.roleArn");
// 自定义角色会话名称，用来区分不同的令牌，例如可填写为SessionTest。
String roleSessionName = env.get("oss.roleSessionName");

// regionId表示RAM的地域ID。以华东1（杭州）地域为例，regionID填写为cn-hangzhou。也可以保留默认值，默认值为空字符串（""）。
String regionId = "";
// 添加endpoint。适用于Java SDK 3.12.0及以上版本。
DefaultProfile.addEndpoint(regionId, "Sts", endpoint);
// 构造default profile。
IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, accessKeySecret);
// 构造client。
DefaultAcsClient client = new DefaultAcsClient(profile);
AssumeRoleRequest request = new AssumeRoleRequest();
// 适用于Java SDK 3.12.0及以上版本。
request.setSysMethod(MethodType.POST);
request.setRoleArn(roleArn);
request.setRoleSessionName(roleSessionName);
request.setDurationSeconds(43200L); // 设置临时访问凭证的有效时间为3600秒。
AssumeRoleResponse assumeRoleResponse = client.getAcsResponse(request);
return {
    accessKeyId: assumeRoleResponse.getCredentials().getAccessKeyId(),
    accessKeySecret: assumeRoleResponse.getCredentials().getAccessKeySecret(),
    stsToken: assumeRoleResponse.getCredentials().getSecurityToken()
}
