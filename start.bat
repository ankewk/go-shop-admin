@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo Go Shop Admin 启动脚本
echo ========================================

:menu
echo.
echo 请选择启动方式:
echo 1. 本地启动 (开发环境)
echo 2. 本地启动 (UAT环境)
echo 3. 本地启动 (生产环境)
echo 4. Docker启动 (开发环境)
echo 5. Docker启动 (UAT环境)
echo 6. Docker启动 (生产环境)
echo 7. 退出
echo.
set /p choice=请输入选择 (1-7): 

if "%choice%"=="1" goto local-dev
if "%choice%"=="2" goto local-uat
if "%choice%"=="3" goto local-prod
if "%choice%"=="4" goto docker-dev
if "%choice%"=="5" goto docker-uat
if "%choice%"=="6" goto docker-prod
if "%choice%"=="7" goto exit
goto menu

:local-dev
echo.
echo 启动本地开发环境...
npm run start:dev
goto end

:local-uat
echo.
echo 启动本地UAT环境...
npm run start:uat
goto end

:local-prod
echo.
echo 启动本地生产环境...
npm run start:prod
goto end

:docker-dev
echo.
echo 启动Docker开发环境...
docker-compose -f docker-compose.dev.yml up --build -d
echo.
echo Docker开发环境启动完成！
echo 访问地址: http://localhost:4200
echo 查看日志: docker-compose -f docker-compose.dev.yml logs -f
echo 停止服务: docker-compose -f docker-compose.dev.yml down
goto end

:docker-uat
echo.
echo 启动Docker UAT环境...
docker-compose -f docker-compose.uat.yml up --build -d
echo.
echo Docker UAT环境启动完成！
echo 访问地址: http://localhost:4201
echo 查看日志: docker-compose -f docker-compose.uat.yml logs -f
echo 停止服务: docker-compose -f docker-compose.uat.yml down
goto end

:docker-prod
echo.
echo 启动Docker生产环境...
docker-compose -f docker-compose.prod.yml up --build -d
echo.
echo Docker生产环境启动完成！
echo 访问地址: http://localhost:4202
echo 查看日志: docker-compose -f docker-compose.prod.yml logs -f
echo 停止服务: docker-compose -f docker-compose.prod.yml down
goto end

:exit
echo.
echo 退出启动脚本
goto end

:end
pause 