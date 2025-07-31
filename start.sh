#!/bin/bash

echo "========================================"
echo "Go Shop Admin 启动脚本"
echo "========================================"

# 检查Docker是否安装
check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "警告: Docker未安装，Docker启动选项将不可用"
        return 1
    fi
    if ! command -v docker-compose &> /dev/null; then
        echo "警告: Docker Compose未安装，Docker启动选项将不可用"
        return 1
    fi
    return 0
}

# 显示菜单
show_menu() {
    echo ""
    echo "请选择启动方式:"
    echo "1. 本地启动 (开发环境)"
    echo "2. 本地启动 (UAT环境)"
    echo "3. 本地启动 (生产环境)"
    if check_docker; then
        echo "4. Docker启动 (开发环境)"
        echo "5. Docker启动 (UAT环境)"
        echo "6. Docker启动 (生产环境)"
        echo "7. 退出"
    else
        echo "4. 退出"
    fi
    echo ""
}

# 本地启动函数
local_start() {
    local env=$1
    echo ""
    echo "启动本地${env}环境..."
    npm run start:${env}
}

# Docker启动函数
docker_start() {
    local compose_file=$1
    local service=$2
    local port=$3
    echo ""
    echo "启动Docker ${service}环境..."
    docker-compose -f ${compose_file} up --build -d
    echo ""
    echo "✅ Docker ${service}环境启动完成！"
    echo "🌐 访问地址: http://localhost:${port}"
    echo "📝 查看日志: docker-compose -f ${compose_file} logs -f"
    echo "🛑 停止服务: docker-compose -f ${compose_file} down"
}

# 主循环
while true; do
    show_menu
    
    if check_docker; then
        read -p "请输入选择 (1-7): " choice
    else
        read -p "请输入选择 (1-4): " choice
    fi
    
    case $choice in
        1)
            local_start "dev"
            break
            ;;
        2)
            local_start "uat"
            break
            ;;
        3)
            local_start "prod"
            break
            ;;
        4)
            if check_docker; then
                docker_start "docker-compose.dev.yml" "go-shop-admin-dev" "4200"
            else
                echo "退出启动脚本"
                exit 0
            fi
            break
            ;;
        5)
            if check_docker; then
                docker_start "docker-compose.uat.yml" "go-shop-admin-uat" "4201"
            else
                echo "退出启动脚本"
                exit 0
            fi
            break
            ;;
        6)
            if check_docker; then
                docker_start "docker-compose.prod.yml" "go-shop-admin-prod" "4202"
            else
                echo "退出启动脚本"
                exit 0
            fi
            break
            ;;
        7)
            if check_docker; then
                echo "退出启动脚本"
                exit 0
            else
                echo "无效选择，请重新输入"
            fi
            ;;
        *)
            echo "无效选择，请重新输入"
            ;;
    esac
done 