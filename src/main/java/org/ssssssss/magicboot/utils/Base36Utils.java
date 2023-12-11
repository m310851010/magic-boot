package org.ssssssss.magicboot.utils;

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
    public static String nextNum(String base36Num) {
        return new BigInteger(base36Num, 36).add(BigInteger.ONE).toString(36);
    }

}
