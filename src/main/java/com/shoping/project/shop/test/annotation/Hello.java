package com.shoping.project.test.annotation;

import java.lang.annotation.*;

/**
 * @author 28461
 */
@Target({
        ElementType.FIELD,
        ElementType.METHOD
})
@Retention(RetentionPolicy.RUNTIME) //注解的生命周期
@Inherited  //子类可以继承父类定义的Annotation,仅针对@Target(ElementType.TYPE)类型的annotation有效
public @interface Hello {
    int min() default 1;
    int max() default 255;
    String value() default "";
}

