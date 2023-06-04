# 建表语句
-- 用户表
DROP TABLE IF EXISTS pay_user;
CREATE TABLE `pay_user` (
                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                            `username` varchar(20) DEFAULT NULL COMMENT '用户名',
                            `account` varchar(30) DEFAULT NULL COMMENT '账号',
                            `password` varchar(30) DEFAULT NULL COMMENT '密码',
                            `gender` varchar(10) DEFAULT NULL COMMENT '性别(男/女)',
                            `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
                            `register_type` varchar(10) DEFAULT NULL COMMENT '注册方式(短信、密码)',
                            `tag_id` bigint DEFAULT NULL COMMENT '用户标签id(关联pay_tag表)',
                            `create_user` varchar(128) NOT NULL COMMENT '创建用户',
                            `update_user` varchar(128) NOT NULL COMMENT '更新用户',
                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `status` varchar(10) NOT NULL COMMENT '状态(NORMAL/DELETED)',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 商品表
DROP TABLE IF EXISTS pay_commodity;
CREATE TABLE `pay_commodity` (
                                 `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                 `commodity_name` varchar(128) DEFAULT NULL COMMENT '商品名称',
                                 `commodity_type` varchar(20) DEFAULT NULL COMMENT '商品类型(收费、免费)',
                                 `commodity_price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
                                 `commodity_tag_id` bigint DEFAULT NULL COMMENT '商品标签id(关联pay_tag表)',
                                 `commodity_content` varchar(1024) DEFAULT NULL COMMENT '商品内容',
                                 `commodity_url` varchar(255) DEFAULT NULL COMMENT '商品链接url',
                                 `pay_num` int DEFAULT NULL COMMENT '付费人数',
                                 `view_num` int DEFAULT NULL COMMENT '查看人数',
                                 `create_user` varchar(128) NOT NULL COMMENT '创建用户',
                                 `update_user` varchar(128) NOT NULL COMMENT '更新用户',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                 `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 标签表
DROP TABLE IF EXISTS pay_tag;
CREATE TABLE `pay_tag` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                           `tag_type` varchar(10) DEFAULT NULL COMMENT '标签类型(用户、商品)',
                           `tag_name` varchar(30) DEFAULT NULL COMMENT '标签名称',
                           `tag_sort` int DEFAULT NULL COMMENT '标签顺序',
                           `tag_desc` varchar(255) DEFAULT NULL COMMENT '标签描述',
                           `tag_heat` int DEFAULT NULL COMMENT '标签热度',
                           `create_user` varchar(128) NOT NULL COMMENT '创建用户',
                           `update_user` bigint NOT NULL COMMENT '更新用户',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           `status` varchar(10) NOT NULL COMMENT '状态',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 订单表
DROP TABLE IF EXISTS pay_order;
CREATE TABLE `pay_order` (
                             `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                             `order_no` varchar(64) NOT NULL COMMENT '订单编号',
                             `user_id` bigint DEFAULT NULL COMMENT '用户id(关联pay_user)',
                             `commodity_id` bigint DEFAULT NULL COMMENT '商品id(关联pay_commodity)',
                             `pay_status` varchar(10) DEFAULT NULL COMMENT '支付状态(已支付、未支付)',
                             `money` decimal(10,2) DEFAULT NULL COMMENT '交易金额',
                             `callback_url` varchar(500) DEFAULT NULL COMMENT '回调url',
                             `channel_no` varchar(20) DEFAULT NULL COMMENT '渠道号(支付宝、微信支付、银联支付)',
                             `qr_code` varchar(255) DEFAULT NULL COMMENT '二维码',
                             `expire_time` datetime DEFAULT NULL COMMENT '二维码过期时间',
                             `create_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建用户',
                             `update_user` bigint NOT NULL COMMENT '更新用户',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                             PRIMARY KEY (`id`,`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 流水表
DROP TABLE IF EXISTS pay_log;
CREATE TABLE `pay_log` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                           `log_no` bigint DEFAULT NULL COMMENT '流水号',
                           `user_id` bigint DEFAULT NULL COMMENT '用户id',
                           `order_id` bigint DEFAULT NULL COMMENT '订单id',
                           `change_money` decimal(10,2) DEFAULT NULL COMMENT '变动金额',
                           `create_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建用户',
                           `update_user` bigint NOT NULL COMMENT '更新用户',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 用户商品关联表
DROP TABLE IF EXISTS pay_user_commodity;
CREATE TABLE `pay_user_commodity` (
                                      `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
                                      `user_id` bigint DEFAULT NULL COMMENT '用户id',
                                      `commodity_id` bigint DEFAULT NULL COMMENT '商品id',
                                      `create_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建用户',
                                      `update_user` bigint NOT NULL COMMENT '更新用户',
                                      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                      `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;