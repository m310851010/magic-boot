package org.ssssssss.magicboot.extension;

import cn.hutool.core.lang.Snowflake;
import org.springframework.stereotype.Component;
import org.ssssssss.magicapi.core.config.MagicFunction;
import org.ssssssss.script.annotation.Comment;
import org.ssssssss.script.annotation.Function;

import java.lang.management.ManagementFactory;

/**
 * 扩展函数
 */
@Component
public class XMagicMagicFunction implements MagicFunction {
    private static Snowflake snowflake;
    public XMagicMagicFunction(Snowflake snowflake){
        XMagicMagicFunction.snowflake = snowflake;
    }

    @Function
    @Comment("使用Snowflake生成ID")
    public static long nextId() {
        return snowflake.nextId();
    }


    @Function
    @Comment("获取Java虚拟机的开始运行时间")
    public static long getJavaVMStartTime() {
        return ManagementFactory.getRuntimeMXBean().getStartTime();
    }
}
