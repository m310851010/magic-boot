package org.ssssssss.magicboot.extension;

import cn.hutool.core.lang.Snowflake;
import org.springframework.stereotype.Component;
import org.ssssssss.magicapi.core.config.MagicFunction;
import org.ssssssss.script.annotation.Comment;
import org.ssssssss.script.annotation.Function;

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
}
