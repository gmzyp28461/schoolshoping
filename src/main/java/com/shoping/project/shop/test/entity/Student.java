package com.shoping.project.test.entity;


import com.shoping.project.test.annotation.Hello;

public class Student {

    @Hello(min = 2,max = 20)
    public String id;

    @Hello(max = 20)
    public String name;

    public String addr;

    @Hello(max = 20)
    public int age;

    public int sex;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", addr='" + addr + '\'' +
                ", age=" + age +
                ", sex=" + sex +
                '}';
    }


    public Student(String id, String name, String addr, int age, int sex) {
        this.id = id;
        this.name = name;
        this.addr = addr;
        this.age = age;
        this.sex = sex;
    }

    public Student(){}
}
