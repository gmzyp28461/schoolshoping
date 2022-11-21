package com.shoping.project.test;

/**
 * @author 28461
 */
public class ThreadTest {
    public static void main(String[] args) {
        //方法一
        Thread thread1 = new MyThread();
        thread1.start();
        //方法二
        Thread thread2 = new Thread(new MyRunnable());
        thread2.start();
    }
}

class MyThread extends Thread{
//    @Override
//    public void run(){
//        System.out.println("Thread start!!!!!!");
//        int n=0;
//        while (!isInterrupted()){
//            n++;
//            System.out.println(n+"hello");
//        }
//    }

    @Override
    public void run(){
        Thread hello = new HelloThread();
        hello.start();
        try {
            hello.join();
        } catch (InterruptedException e) {
            System.out.println("interrupted!");
        }
        hello.interrupt();
    }

}

class HelloThread extends Thread{
    @Override
    public void run(){
        int n=0;
        while (!isInterrupted()){
            n++;
            System.out.println(n+"hello!");
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                break;
            }
        }
    }
}

class MyRunnable implements Runnable{
    @Override
    public void run() {
        System.out.println("Runnable start!!!");
    }

}
