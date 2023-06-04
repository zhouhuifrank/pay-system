package com.frankzhou.common.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * @author This.FrankZhou
 * @version 1.0
 * @description 分页参数请求类 需要分页查找时继承即可
 * @date 2023-04-08
 */
@Data
public class PageParamDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 当前页数(前端)f
     */
    private Integer currPage;

    /**
     * 开始行数(后端)
     */
    private Integer startRow;

    /**
     * 页面大小(前端+后端)
     */
    private Integer pageSize;

    /**
     * 排序字段
     */
    private String orderBy;

    /**
     * 顺序 asc升序/desc降序
     */
    private String sort;
}
