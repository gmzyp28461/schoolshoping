package com.shoping.project.test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.SimpleFormatter;

/**
 * @author 28461
 */
public class DateTest {
//    /**
//     * Date
//     * @param args
//     */
//    public static void main(String[] args) {
//        Date date = new Date();
//        System.out.println(date.getYear()+1900);
//        System.out.println(date.getMonth()+1);
//        System.out.println(date.getDate());
//        //转为string
//        System.out.println(date.toString());
//        //自定义返回日期格式
//        SimpleDateFormat simple = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
//        System.out.println(simple.format(date));
//    }

    public static void main(String[] args) {
        Calendar calendar = Calendar.getInstance();
        int y = calendar.get(Calendar.YEAR);
        int m = calendar.get(Calendar.MONTH)+1;
        int d = calendar.get(Calendar.DAY_OF_MONTH);
        int yw = calendar.get(Calendar.WEEK_OF_YEAR);
        int mw = calendar.get(Calendar.WEEK_OF_MONTH);
        int h = calendar.get(Calendar.HOUR_OF_DAY);
        int mi = calendar.get(Calendar.MINUTE);
        int ss = calendar.get(Calendar.SECOND);
        System.out.println(y);
        System.out.println(m);
        System.out.println(d);
        System.out.println(yw);
        System.out.println(mw);
        System.out.println(h);
        System.out.println(mi);
        System.out.println(ss);
    }
}
