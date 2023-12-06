package org.ssssssss.magicboot.configuration;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.ssssssss.magicboot.model.Global;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Configuration
public class MagicBootConfiguration {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
        LocalDateTimeSerializer localDateTimeSerializer = new LocalDateTimeSerializer(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        return builder -> builder.serializerByType(LocalDateTime.class, localDateTimeSerializer);
    }

    /**
     * ID生成器
     * @param global Global
     * @return Snowflake
     */
    @Bean
    public Snowflake getSnowflake(Global global) {
        return IdUtil.getSnowflake(global.workerId, global.datacenterId);
    }
}
