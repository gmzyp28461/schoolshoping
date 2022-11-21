package com.shoping.project.test;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

/**
 * @author 28461
 * 迭代器获取文件所在目录下的所有文件目录,或者返回目录下的指定文件
 */
public class FileTest {
    public static void main(String[] args) {
        File file = new File("C:\\Users\\28461\\Desktop");
        File[] files = file.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".md");
            }
        });
        if (files != null) {
            Iterator<File> iterable= Arrays.stream(files).iterator();
            while (iterable.hasNext()){
                System.out.println(iterable.next());
            }
        }
    }

}
