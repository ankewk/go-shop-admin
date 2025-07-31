@echo off
chcp 65001

REM 默认环境为生产环境
set ENV=%1
if "%ENV%"=="" set ENV=prod

echo 启动Go Shop Admin后台管理系统 - %ENV% 环境...

REM 检查Docker是否安装
docker --version >nul 2>&1
if errorlevel 1 (
    echo 错误: Docker未安装，请先安装Docker Desktop
    pause
    exit /b 1
)

REM 检查Docker Compose是否安装
docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo 错误: Docker Compose未安装，请确保Docker Desktop包含Compose
    pause
    exit /b 1
)

REM 根据环境选择compose文件
if "%ENV%"=="dev" (
    set COMPOSE_FILE=docker-compose.dev.yml
    set PORT=4200
    set API_PORT=8080
    set DB_PORT=3307
) else if "%ENV%"=="uat" (
    set COMPOSE_FILE=docker-compose.uat.yml
    set PORT=4201
    set API_PORT=8081
    set DB_PORT=3308
) else if "%ENV%"=="prod" (
    set COMPOSE_FILE=docker-compose.prod.yml
    set PORT=4200
    set API_PORT=8080
    set DB_PORT=3306
) else (
    echo 错误: 不支持的环境 '%ENV%'
    echo 支持的环境: dev, uat, prod
    echo 用法: %0 [dev^|uat^|prod]
    pause
    exit /b 1
)

REM 停止现有容器
echo 停止现有容器...
docker-compose -f %COMPOSE_FILE% down

REM 构建并启动服务
echo 构建并启动 %ENV% 环境服务...
docker-compose -f %COMPOSE_FILE% up --build -d

REM 等待服务启动
echo 等待服务启动...
timeout /t 15 /nobreak >nul

REM 显示服务状态
echo 服务状态:
docker-compose -f %COMPOSE_FILE% ps

echo.
echo ✅ %ENV% 环境启动完成！
echo 🌐 前端访问地址: http://localhost:%PORT%
echo 🔧 后端API地址: http://localhost:%API_PORT%
echo 📊 API文档地址: http://localhost:%API_PORT%/swagger/index.html
echo 💾 数据库端口: %DB_PORT%
echo.
echo 📝 查看日志: docker-compose -f %COMPOSE_FILE% logs -f
echo 🛑 停止服务: docker-compose -f %COMPOSE_FILE% down
pause 