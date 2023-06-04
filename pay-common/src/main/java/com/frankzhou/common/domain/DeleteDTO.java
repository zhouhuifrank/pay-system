package com.frankzhou.common.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 删除请求类
 * @date 2023-04-08
 */
@Data
public class DeleteDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 单条数据删除
     */
    private Long id;

    /**
     * 多条数据删除 前端使用逗号隔开传入
     */
    private String ids;
}
