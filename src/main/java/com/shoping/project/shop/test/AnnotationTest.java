package com.shoping.project.test;

import com.shoping.project.test.annotation.Hello;
import com.shoping.project.test.entity.Student;

import java.lang.reflect.Field;



public class AnnotationTest {

//    /**
//     * 反射用法
//     * @param args
//     */
//    public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
//        User user1 = new User();
//        user1.setLoginName("小米");
//        Class user = user1.getClass();
//        Field fields = user.getDeclaredField("loginName");
//        fields.setAccessible(true);
//        fields.set(user1,"小张");
//        System.out.println(fields.get(user1));
//    }


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


    /**
     * 注解使用
     */
    public static void main(String[] args) throws IllegalAccessException {
        Student student = new Student("20180206872","","江西省九江市",23,1);
        for (Field field : student.getClass().getFields()){
            Hello hello = field.getAnnotation(Hello.class);
            if (hello!=null){
                Object value = field.get(student);
                if (value instanceof String){
                    String s = (String) value;
                    if (s.length()< hello.min() || s.length()> hello.max()){
                        throw new IllegalArgumentException("Invalid field:" +field.getName());
                    }
                }
            }
        }
    }
}
