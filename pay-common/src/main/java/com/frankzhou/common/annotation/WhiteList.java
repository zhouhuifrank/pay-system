package com.frankzhou.common.annotation;

import java.lang.annotation.*;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 统一白名单注解
 * @date 2023-06-04
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface WhiteList {
    /**
     * 关键字段
     */
    String key() default "";

    /**
     * 拦截时返回的信息
     */
    String returnMessage() default "";
}
