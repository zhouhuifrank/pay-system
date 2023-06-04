package com.frankzhou.common.annotation;

import java.lang.annotation.*;
import java.util.concurrent.TimeUnit;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 分布式锁注解
 * @date 2023-06-04
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RedissonLock {

    String prefixKey() default "";

    String key() default "";

    long waitTime() default -1;

    TimeUnit unit() default TimeUnit.MILLISECONDS;
}
