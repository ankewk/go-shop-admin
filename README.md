# Go Shop Admin - 后台管理系统

基于 Angular 17 和 Go-Shop-API 构建的现代化后台管理系统，提供用户管理和产品管理功能。

## 🚀 项目特色

- **现代化技术栈**: Angular 17 + Bootstrap 5 + TypeScript
- **响应式设计**: 支持桌面端和移动端
- **Docker 部署**: 一键启动完整开发/生产环境
- **API 集成**: 完全对接 Go-Shop-API 后端接口
- **模块化架构**: 清晰的项目结构和组件化开发

## 📋 功能模块

### 用户管理
- ✅ 用户列表分页展示
- ✅ 新增用户
- ✅ 编辑用户信息
- ✅ 删除用户（软删除）
- ✅ 用户状态管理

### 产品管理
- ✅ 产品列表分页展示
- ✅ 新增产品
- ✅ 编辑产品信息
- ✅ 删除产品
- ✅ 产品状态管理
- ✅ 价格和库存管理

### 系统功能
- ✅ 响应式侧边导航
- ✅ 顶部导航栏
- ✅ 仪表板概览
- ✅ API 状态监控

## 🛠️ 技术栈

- **前端框架**: Angular 17
- **UI 框架**: Bootstrap 5
- **图标库**: Bootstrap Icons
- **HTTP 客户端**: Angular HttpClient
- **路由**: Angular Router
- **状态管理**: RxJS
- **构建工具**: Angular CLI
- **容器化**: Docker + Docker Compose

## 📦 项目结构

```
go-shop-admin/
├── src/
│   ├── app/
│   │   ├── components/          # 页面组件
│   │   │   ├── dashboard/       # 仪表板
│   │   │   ├── user-list/       # 用户列表
│   │   │   ├── product-list/    # 产品列表
│   │   │   ├── sidebar/         # 侧边栏
│   │   │   └── navbar/          # 导航栏
│   │   ├── models/              # 数据模型
│   │   ├── services/            # 服务层
│   │   ├── app.component.ts     # 根组件
│   │   ├── app.config.ts        # 应用配置
│   │   └── app.routes.ts        # 路由配置
│   ├── environments/            # 环境配置
│   ├── assets/                  # 静态资源
│   └── styles.scss              # 全局样式
├── docker-compose.yml           # 生产环境编排
├── docker-compose.dev.yml       # 开发环境编排
├── Dockerfile                   # 生产环境镜像
├── Dockerfile.dev               # 开发环境镜像
├── nginx.conf                   # Nginx 配置
├── init.sql                     # 数据库初始化
└── README.md                    # 项目文档
```

## 🚀 快速开始

### 方式一：Docker Compose 启动（推荐）

#### 前提条件
- 安装 Docker 和 Docker Compose
- 确保相关端口未被占用（见下方端口说明）

#### 多环境支持

项目支持三个环境：

- **DEV（开发环境）**: 用于日常开发，支持热重载
- **UAT（用户验收测试环境）**: 用于测试验证
- **PROD（生产环境）**: 用于正式部署

#### 统一启动脚本

**Linux/Mac:**
```bash
# 给脚本执行权限
chmod +x *.sh

# 启动开发环境（默认）
./start.sh dev

# 启动UAT环境
./start.sh uat

# 启动生产环境
./start.sh prod

# 或使用专用脚本
./start-dev.sh      # 开发环境
./start-uat.sh      # UAT环境
./start-prod.sh     # 生产环境
```

**Windows:**
```batch
# 启动指定环境
start.bat dev       # 开发环境
start.bat uat       # UAT环境
start.bat prod      # 生产环境

# 或使用专用脚本
start-dev.bat       # 开发环境
start-uat.bat       # UAT环境
start-prod.bat      # 生产环境
```

#### 手动启动命令

**开发环境:**
```bash
docker-compose -f docker-compose.dev.yml up --build -d
docker-compose -f docker-compose.dev.yml logs -f
docker-compose -f docker-compose.dev.yml down
```

**UAT环境:**
```bash
docker-compose -f docker-compose.uat.yml up --build -d
docker-compose -f docker-compose.uat.yml logs -f
docker-compose -f docker-compose.uat.yml down
```

**生产环境:**
```bash
docker-compose -f docker-compose.prod.yml up --build -d
docker-compose -f docker-compose.prod.yml logs -f
docker-compose -f docker-compose.prod.yml down
```

### 方式二：本地开发启动

```bash
# 安装依赖
npm install

# 启动开发服务器
npm start

# 构建生产版本
npm run build
```

## 🌐 访问地址

### 生产环境
- **前端管理系统**: http://localhost:4200
- **后端 API**: http://localhost:8080
- **API 文档**: http://localhost:8080/swagger/index.html
- **数据库**: localhost:3306

### 开发环境
- **前端开发服务器**: http://localhost:4200
- **后端 API**: http://localhost:8080
- **开发数据库**: localhost:3307

## 💾 数据库信息

**生产环境:**
- 主机: localhost
- 端口: 3306
- 数据库: go_shop
- 用户名: root
- 密码: 123456

**开发环境:**
- 主机: localhost
- 端口: 3307
- 数据库: go_shop_dev
- 用户名: root
- 密码: 123456

## 🔧 开发指南

### 添加新模块

1. 创建模型接口（models/）
2. 创建服务（services/）
3. 创建组件（components/）
4. 配置路由（app.routes.ts）

### 环境配置

修改 `src/environments/environment.ts` 配置开发环境 API 地址：

```typescript
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api/v1'
};
```

修改 `src/environments/environment.prod.ts` 配置生产环境 API 地址。

### API 接口说明

项目已完全对接 Go-Shop-API 的以下接口：

#### 用户管理 API
- `GET /api/v1/users` - 获取用户列表
- `POST /api/v1/users` - 创建用户
- `GET /api/v1/users/{id}` - 获取用户详情
- `PUT /api/v1/users/{id}` - 更新用户
- `DELETE /api/v1/users/{id}` - 删除用户

#### 产品管理 API
- `GET /api/v1/products` - 获取产品列表
- `POST /api/v1/products` - 创建产品
- `GET /api/v1/products/{id}` - 获取产品详情
- `PUT /api/v1/products/{id}` - 更新产品
- `DELETE /api/v1/products/{id}` - 删除产品

## 🐛 常见问题

### Docker 相关

**Q: 端口冲突怎么办？**
A: 修改 docker-compose.yml 中的端口映射，例如改为 "4201:80"

**Q: 数据库连接失败？**
A: 确保 go-shop-api 项目的数据库配置正确，等待 MySQL 容器完全启动

**Q: 前端无法访问后端 API？**
A: 检查 nginx.conf 中的代理配置和容器网络连接

### 开发相关

**Q: npm install 失败？**
A: 尝试使用 cnpm 或配置 npm 镜像源

**Q: 编译错误？**
A: 确保 Node.js 版本 >= 16，Angular CLI 版本 >= 17

## 📝 更新日志

### v1.0.0 (2024-01-01)
- ✅ 项目初始化
- ✅ 用户管理模块
- ✅ 产品管理模块
- ✅ Docker 容器化部署
- ✅ 响应式界面设计

## 🤝 贡献指南

1. Fork 项目
2. 创建功能分支: `git checkout -b feature/AmazingFeature`
3. 提交更改: `git commit -m 'Add some AmazingFeature'`
4. 推送到分支: `git push origin feature/AmazingFeature`
5. 提交 Pull Request

## 📄 许可证

本项目使用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 📞 联系我们

- 项目地址: https://github.com/your-username/go-shop-admin
- 问题反馈: https://github.com/your-username/go-shop-admin/issues

---

**注意**: 首次启动可能需要较长时间下载 Docker 镜像和构建应用，请耐心等待。 