package com.frankzhou.common.annotation;

import java.lang.annotation.*;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 权限校验注解
 * @date 2023-06-04
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthCheck {
    /**
     * 必须拥有的角色
     */
    String mustRole() default "";

    /**
     * 拥有其中一个角色即可
     */
    String[] anyRole() default "";
}
