#!/bin/bash

echo "启动Go Shop Admin后台管理系统 - 生产环境..."

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

# 确认生产环境部署
read -p "⚠️  确认要启动生产环境吗？(yes/no): " confirm
if [[ $confirm != "yes" ]]; then
    echo "❌ 取消启动生产环境"
    exit 0
fi

# 停止现有容器
echo "停止现有容器..."
docker-compose -f docker-compose.prod.yml down

# 构建并启动生产服务
echo "构建并启动生产环境服务..."
docker-compose -f docker-compose.prod.yml up --build -d

# 等待服务启动
echo "等待服务启动..."
sleep 20

# 显示服务状态
echo "服务状态:"
docker-compose -f docker-compose.prod.yml ps

echo ""
echo "✅ 生产环境启动完成！"
echo "🌐 前端访问地址: http://localhost:4200"
echo "🔧 后端API地址: http://localhost:8080"
echo "📊 API文档地址: http://localhost:8080/swagger/index.html"
echo "💾 数据库端口: 3306"
echo ""
echo "⚠️  生产环境请注意数据安全！"
echo "📝 查看日志: docker-compose -f docker-compose.prod.yml logs -f"
echo "🛑 停止服务: docker-compose -f docker-compose.prod.yml down" 