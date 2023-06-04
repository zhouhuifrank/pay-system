package com.frankzhou.common.annotation;

import java.lang.annotation.*;
import java.util.concurrent.TimeUnit;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 防重复提交注解
 * @date 2023-06-04
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RepeatSubmit {

    String key() default "";

    int interval() default 1;

    TimeUnit unit() default TimeUnit.MILLISECONDS;
}
