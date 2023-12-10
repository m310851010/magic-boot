package org.ssssssss.magicboot.model;

import java.util.HashMap;
import java.util.Map;

public enum StatusCode {

    CERTIFICATE_EXPIRED(402, "登录已超时，请重新登录"),
    FORBIDDEN(403, "抱歉！您无权限访问");

    StatusCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    private int code;

    private String message;

    public Map<String, Object> json(){
        return newJsonBean(this.code, this.message, null);
    }

    public static Map<String, Object> newJsonBean( int code, String message, Object data) {
        Map<String, Object> jsonBean = new HashMap<>();
        jsonBean.put("code", code);
        jsonBean.put("message", message);
        jsonBean.put("data", data);
        return jsonBean;
    }
}
