package org.ssssssss.magicboot.interceptor;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.Snowflake;
import org.springframework.stereotype.Component;
import org.ssssssss.magicapi.modules.db.inteceptor.NamedTableInterceptor;
import org.ssssssss.magicapi.modules.db.model.SqlMode;
import org.ssssssss.magicapi.modules.db.table.NamedTable;

import java.util.Date;

import static org.ssssssss.magicboot.model.MagicBootConstants.*;

@Component
public class NamedTableHandlerInterceptor implements NamedTableInterceptor {
    private final Snowflake snowflake;
    public NamedTableHandlerInterceptor(Snowflake snowflake){
        this.snowflake = snowflake;
    }

    @Override
    public void preHandle(SqlMode sqlMode, NamedTable namedTable) {

        if(Boolean.TRUE == namedTable.getAttribute(COMMON_FIELD)){
            if(sqlMode == SqlMode.INSERT) {
                long id = snowflake.nextId();
                namedTable.setAttribute(namedTable.getPrimary(), id);
                namedTable.column(namedTable.getPrimary(), id);
                namedTable.column(CREATE_BY, StpUtil.isLogin() ? StpUtil.getLoginId() : null);
                namedTable.column(CREATE_DATE, new Date());
            }
            if(sqlMode == SqlMode.UPDATE){
                namedTable.setAttribute(namedTable.getPrimary(), namedTable.getColumns().get(namedTable.getPrimary()));
                namedTable.column(UPDATE_BY, StpUtil.getLoginId());
                namedTable.column(UPDATE_DATE, new Date());
            }
        }
    }

}
