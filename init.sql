-- 创建数据库
CREATE DATABASE IF NOT EXISTS go_shop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE go_shop;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    avatar VARCHAR(500),
    status INT DEFAULT 1 COMMENT '用户状态 1:正常 0:禁用',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL
);

-- 创建产品表
CREATE TABLE IF NOT EXISTS products (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category VARCHAR(50),
    status INT DEFAULT 1 COMMENT '状态：1正常，0下架',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 插入示例用户数据
INSERT INTO users (name, email, phone, status) VALUES
('张三', 'zhangsan@example.com', '13888888888', 1),
('李四', 'lisi@example.com', '13999999999', 1),
('王五', 'wangwu@example.com', '13777777777', 0),
('赵六', 'zhaoliu@example.com', '13666666666', 1),
('陈七', 'chenqi@example.com', '13555555555', 1);

-- 插入示例产品数据
INSERT INTO products (name, description, price, stock, category, status) VALUES
('iPhone 15', '最新款iPhone手机', 8999.99, 100, '电子产品', 1),
('MacBook Pro', '高性能笔记本电脑', 15999.99, 50, '电子产品', 1),
('AirPods Pro', '无线降噪耳机', 1999.99, 200, '电子产品', 1),
('iPad Air', '轻薄平板电脑', 4999.99, 80, '电子产品', 1),
('Apple Watch', '智能手表', 2999.99, 150, '电子产品', 0); 