#!/bin/bash

echo "启动Go Shop Admin后台管理系统 - UAT环境..."

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
docker-compose -f docker-compose.uat.yml down

# 构建并启动UAT服务
echo "构建并启动UAT环境服务..."
docker-compose -f docker-compose.uat.yml up --build -d

# 等待服务启动
echo "等待服务启动..."
sleep 15

# 显示服务状态
echo "服务状态:"
docker-compose -f docker-compose.uat.yml ps

echo ""
echo "✅ UAT环境启动完成！"
echo "🌐 前端访问地址: http://localhost:4201"
echo "🔧 后端API地址: http://localhost:8081"
echo "📊 API文档地址: http://localhost:8081/swagger/index.html"
echo "💾 数据库端口: 3308"
echo ""
echo "📝 查看日志: docker-compose -f docker-compose.uat.yml logs -f"
echo "🛑 停止服务: docker-compose -f docker-compose.uat.yml down" 