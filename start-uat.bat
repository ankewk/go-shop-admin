@echo off
chcp 65001
echo 启动Go Shop Admin后台管理系统 - UAT环境...

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

REM 停止现有容器
echo 停止现有容器...
docker-compose -f docker-compose.uat.yml down

REM 构建并启动UAT服务
echo 构建并启动UAT环境服务...
docker-compose -f docker-compose.uat.yml up --build -d

REM 等待服务启动
echo 等待服务启动...
timeout /t 15 /nobreak >nul

REM 显示服务状态
echo 服务状态:
docker-compose -f docker-compose.uat.yml ps

echo.
echo ✅ UAT环境启动完成！
echo 🌐 前端访问地址: http://localhost:4201
echo 🔧 后端API地址: http://localhost:8081
echo 📊 API文档地址: http://localhost:8081/swagger/index.html
echo 💾 数据库端口: 3308
echo.
echo 📝 查看日志: docker-compose -f docker-compose.uat.yml logs -f
echo 🛑 停止服务: docker-compose -f docker-compose.uat.yml down
pause 