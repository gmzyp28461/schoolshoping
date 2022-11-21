package com.shoping.project.test;

import com.shoping.project.system.user.domain.User;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class ReflexTest {
    /**
     * 反射用法
     * @param args
     */
    public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
        User user1 = new User();
        user1.setLoginName("小米");
        Class user = user1.getClass();
        Field fields = user.getDeclaredField("loginName");
        fields.setAccessible(true);
        fields.set(user1,"小张");
        System.out.println(fields.get(user1));
    }


//    /**
//     * 动态代理
//     * @param args
//     */
//    public static void main(String[] args) {
//        InvocationHandler handler = new InvocationHandler() {
//            @Override
//            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
//                System.out.println(method);
//                if (method.getName().equals("morning")) {
//                    System.out.println("Good morning, " + args[0]);
//                }
//                return null;
//            }
//        };
//        Hello hello = (Hello) Proxy.newProxyInstance(
//                Hello.class.getClassLoader(), // 传入ClassLoader
//                new Class[] { Hello.class }, // 传入要实现的接口
//                handler); // 传入处理调用方法的InvocationHandler
//        hello.morning("Bob");
//    }
}
