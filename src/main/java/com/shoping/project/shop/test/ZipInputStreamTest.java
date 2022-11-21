package com.shoping.project.test;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.io.*;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * @author 28461
 */
public class ZipInputStreamTest {

//    /**
//     *解压文件夹到指定路径
//     * @param args
//     * @throws IOException
//     */
//    public static void main(String[] args) throws IOException {
//        ZipInputStream zipInput = new ZipInputStream(new FileInputStream("C:\\Users\\28461\\Desktop\\mapper.zip"));
//        ZipEntry entry = null;
//        while ((entry = zipInput.getNextEntry()) != null) {
//            String name = entry.getName();
//            FileOutputStream out = new FileOutputStream("C:\\Users\\28461\\Desktop\\mapper\\"+name);
//            if (!entry.isDirectory()) {
//                int n = 0;
//                byte[] buffer = new byte[100];
//                while ((n = zipInput.read(buffer)) != -1){
//                    out.write(buffer,0,n);
//                }
//            }
//        }
//    }

    /**
     * 向压缩文件中加入文件
     * @param args
     */
    public static void main(String[] args) throws IOException {
        try(ZipOutputStream out = new ZipOutputStream(new FileOutputStream("C:\\Users\\28461\\Desktop\\mapper.zip"))) {
            File file = new File("C:\\Users\\28461\\Desktop\\mapper123");
            File[] files = file.listFiles();
            if (files!=null){
                for (File file1 : files){
                    String name = file1.getName();
                    ZipEntry entry = new ZipEntry(name);
                    out.putNextEntry(entry);
                    out.write(Files.readAllBytes(file1.toPath()));
                    out.closeEntry();
                }
            }
        }
    }

}
