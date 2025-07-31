#!/bin/bash

# 默认环境为生产环境
ENV=${1:-prod}

echo "启动Go Shop Admin后台管理系统 - $ENV 环境..."

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

# 根据环境选择compose文件
case $ENV in
    "dev")
        COMPOSE_FILE="docker-compose.dev.yml"
        PORT="4200"
        API_PORT="8080"
        DB_PORT="3308"
        ;;
    "uat")
        COMPOSE_FILE="docker-compose.uat.yml"
        PORT="4201"
        API_PORT="8081"
        DB_PORT="3308"
        ;;
    "prod")
        COMPOSE_FILE="docker-compose.prod.yml"
        PORT="4200"
        API_PORT="8080"
        DB_PORT="3308"
        ;;
    *)
        echo "错误: 不支持的环境 '$ENV'"
        echo "支持的环境: dev, uat, prod"
        echo "用法: $0 [dev|uat|prod]"
        exit 1
        ;;
esac

# 停止现有容器
echo "停止现有容器..."
docker-compose -f $COMPOSE_FILE down

# 构建并启动服务
echo "构建并启动 $ENV 环境服务..."
docker-compose -f $COMPOSE_FILE up --build -d

# 等待服务启动
echo "等待服务启动..."
sleep 15

# 显示服务状态
echo "服务状态:"
docker-compose -f $COMPOSE_FILE ps

echo ""
echo "✅ $ENV 环境启动完成！"
echo "🌐 前端访问地址: http://localhost:$PORT"
echo "🔧 后端API地址: http://localhost:$API_PORT"
echo "📊 API文档地址: http://localhost:$API_PORT/swagger/index.html"
echo "💾 数据库端口: $DB_PORT"
echo ""
echo "📝 查看日志: docker-compose -f $COMPOSE_FILE logs -f"
echo "🛑 停止服务: docker-compose -f $COMPOSE_FILE down" 