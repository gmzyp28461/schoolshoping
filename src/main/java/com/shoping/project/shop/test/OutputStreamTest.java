package com.shoping.project.test;

import java.io.*;

/**
 * @author 28461
 */
public class OutputStreamTest {
    public static void main(String[] args) throws IOException {
        try(FileInputStream inputStream = new FileInputStream("C:\\Users\\28461\\Desktop\\ruoyi.md");
            FileOutputStream outputStream = new FileOutputStream("C:\\Users\\28461\\Desktop\\ruoyi.txt")) {
            int n;
            byte[] buffer = new byte[1000];
            while ((n=inputStream.read(buffer))!=-1){
                outputStream.write(buffer,0,n);
            }
        }
    }
}
