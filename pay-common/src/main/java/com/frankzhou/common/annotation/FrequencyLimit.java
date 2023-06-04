package com.frankzhou.common.annotation;

import java.lang.annotation.*;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 频率限制注解
 * @date 2023-06-04
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface FrequencyLimit {
}
