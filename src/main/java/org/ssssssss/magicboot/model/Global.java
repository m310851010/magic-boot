package org.ssssssss.magicboot.model;

import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.ssssssss.magicboot.utils.WebUtils;

@Component
public class Global {

    /**
     * 文件上的根目录
     */
    public static String dir;
    public long workerId;
    public long datacenterId;
    public String defaultPassword;

    public final static String USER_FILES_BASE_URL = "/userfiles/";

    public static String getDir() {
        return dir;
    }

    @Value("${upload.dir:D:/mb/}")
    public void setDir(String dir) {
        Global.dir = dir;
    }

    @Value("${snowflake.workerId:1}")
    public void setWorkerId(long workerId) {
        this.workerId = workerId;
    }

    @Value("${snowflake.datacenterId:1}")
    public void setDatacenterId(long datacenterId) {
        this.datacenterId = datacenterId;
    }

    @Value("${default-password:000000}")
    public void setDatacenterId(String defaultPassword) {
        this.defaultPassword = defaultPassword;
    }

    /**
     * 获取上传文件的根目录
     *
     * @return 文件路径
     */
    public static String getUserFilesBaseDir() {
        String dir = getDir();
        if (StrUtil.isBlank(dir)) {
            try {
                dir = WebUtils.getHttpServletRequest().getSession().getServletContext().getRealPath("/");
            } catch (Exception e) {
                return "";
            }
        }
        if (!dir.endsWith("/")) {
            dir += "/";
        }
        return dir;
    }

}
