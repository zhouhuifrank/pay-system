package com.frankzhou.common.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description
 * @date 2023-06-04
 */
@Slf4j
@Aspect
@Component
@Order(0) // 分布式锁必须先于@Transactional注解先执行
public class FrequencyLimitAspect {
}
