#!/bin/bash

echo "启动Go Shop Admin开发环境..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null; then
    echo "错误: Docker未安装，请先安装Docker"
    exit 1
fi

# 检查Docker Compose是否安装
if ! command -v docker-compose &> /dev/null; then
    echo "错误: Docker Compose未安装，请先安装Docker Compose"
    exit 1
fi

# 停止现有容器
echo "停止现有容器..."
docker-compose -f docker-compose.dev.yml down

# 构建并启动开发服务
echo "构建并启动开发服务..."
docker-compose -f docker-compose.dev.yml up --build -d

# 等待服务启动
echo "等待服务启动..."
sleep 15

# 显示服务状态
echo "服务状态:"
docker-compose -f docker-compose.dev.yml ps

echo ""
echo "✅ 开发环境启动完成！"
echo "🌐 前端开发服务器: http://localhost:4200"
echo "🔧 后端API地址: http://localhost:8080"
echo "💾 开发数据库端口: 3308"
echo ""
echo "📝 查看前端日志: docker-compose -f docker-compose.dev.yml logs -f go-shop-admin-dev"
echo "📝 查看后端日志: docker-compose -f docker-compose.dev.yml logs -f go-shop-api-dev"
echo "🛑 停止服务: docker-compose -f docker-compose.dev.yml down" 