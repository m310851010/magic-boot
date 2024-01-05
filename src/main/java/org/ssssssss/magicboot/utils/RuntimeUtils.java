package org.ssssssss.magicboot.utils;

import java.lang.management.ManagementFactory;

public class RuntimeUtils {

    /**
     * 获取Java虚拟机的启动时间
     * @return
     */
    public static long getJavaVMStartTime() {
        return ManagementFactory.getRuntimeMXBean().getStartTime();
    }
}
