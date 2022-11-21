package com.shoping.project.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author 28461
 * 读取文件用法
 */
public class InputStreamTest {
    public static void main(String[] args) throws IOException {
        try(FileInputStream inputStream = new FileInputStream("C:\\Users\\28461\\Desktop\\ruoyi.md")) {
            int n;
            byte[] buffer = new byte[1000];
            while ((n = inputStream.read(buffer)) != -1) {
                System.out.println((char)n);
            }
        }
    }
}
