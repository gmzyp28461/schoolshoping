package com.shoping.project.test;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * @author 28461
 */
public class AlgorithmTest {
    /**
     * URL编码解码
     * @param args
     * @throws UnsupportedEncodingException
     */
//    public static void main(String[] args) throws UnsupportedEncodingException {
//        //URL编码将字符串转码
//        String encode = URLEncoder.encode("中文！", String.valueOf(StandardCharsets.UTF_8));
//        System.out.println(encode);
//        //URL编码将字符串解码
//        String name = URLDecoder.decode(encode, String.valueOf(StandardCharsets.UTF_8));
//        System.out.println(name);
//    }

    /**
     * 哈希算法编码
     * @param args
     */
    public static void main(String[] args) throws Exception {
        // 创建一个MessageDigest实例:
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        md.update("Hello".getBytes(StandardCharsets.UTF_8));
        md.update("World".getBytes(StandardCharsets.UTF_8));
        byte[] result = md.digest();
        System.out.println(new BigInteger(1,result).toString(16));
    }
}
