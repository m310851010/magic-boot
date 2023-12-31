package org.ssssssss.magicboot.utils;

import cn.hutool.core.util.StrUtil;

import java.math.BigInteger;

/**
 * 36进制工具类
 */
public class Base36Utils {

    /**
     * 获取下一个数
     * @param base36Num 36进制的数
     * @return 返回 当前值 + 1
     */
    public static String next(String base36Num) {

        return new BigInteger(base36Num, 36).add(BigInteger.ONE).toString(36);
    }

    /**
     * 获取下一个编码
     * @param code 当前code,比如0000, 一下个code是0001
     * @return
     */
    public static String nextCode(String code) {
        int index = code.length() - 2;
        String endCode  = code.substring(index);
        String nextCode = next(endCode);
        String pad = StrUtil.padPre(nextCode, 2, '0');
        return code.substring(0, index).concat(pad);
    }
}

