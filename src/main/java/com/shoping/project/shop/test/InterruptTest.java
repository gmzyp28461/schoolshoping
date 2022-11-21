package com.shoping.project.test;

/**
 * @author 28461
 */
public class InterruptTest {
    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new MyThread();
        t1.start();
        Thread.sleep(1);    //暂停线程1ms
        t1.interrupt();     //中断线程
        t1.join();      //等待线程完成
        System.out.println("t1 end！！！！！！！");
    }
}


