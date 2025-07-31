@echo off
chcp 65001
echo 启动Go Shop Admin后台管理系统 - 生产环境...

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

REM 确认生产环境部署
set /p confirm=⚠️  确认要启动生产环境吗？(yes/no): 
if not "%confirm%"=="yes" (
    echo ❌ 取消启动生产环境
    pause
    exit /b 0
)

REM 停止现有容器
echo 停止现有容器...
docker-compose -f docker-compose.prod.yml down

REM 构建并启动生产服务
echo 构建并启动生产环境服务...
docker-compose -f docker-compose.prod.yml up --build -d

REM 等待服务启动
echo 等待服务启动...
timeout /t 20 /nobreak >nul

REM 显示服务状态
echo 服务状态:
docker-compose -f docker-compose.prod.yml ps

echo.
echo ✅ 生产环境启动完成！
echo 🌐 前端访问地址: http://localhost:4200
echo 🔧 后端API地址: http://localhost:8080
echo 📊 API文档地址: http://localhost:8080/swagger/index.html
echo 💾 数据库端口: 3306
echo.
echo ⚠️  生产环境请注意数据安全！
echo 📝 查看日志: docker-compose -f docker-compose.prod.yml logs -f
echo 🛑 停止服务: docker-compose -f docker-compose.prod.yml down
pause 