import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserService } from '../../services/user.service';
import { ProductService } from '../../services/product.service';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="dashboard">
      <div class="row mb-4">
        <div class="col-12">
          <h2 class="page-title">仪表板</h2>
          <p class="text-muted">系统概览和统计信息</p>
        </div>
      </div>
      
      <div class="row mb-4">
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="card stat-card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="stat-icon bg-primary">
                  <i class="bi bi-people text-white"></i>
                </div>
                <div class="ms-3">
                  <h5 class="mb-0">{{ stats.totalUsers }}</h5>
                  <small class="text-muted">总用户数</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="card stat-card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="stat-icon bg-success">
                  <i class="bi bi-box text-white"></i>
                </div>
                <div class="ms-3">
                  <h5 class="mb-0">{{ stats.totalProducts }}</h5>
                  <small class="text-muted">总产品数</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="card stat-card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="stat-icon bg-warning">
                  <i class="bi bi-exclamation-triangle text-white"></i>
                </div>
                <div class="ms-3">
                  <h5 class="mb-0">{{ stats.lowStockProducts }}</h5>
                  <small class="text-muted">库存不足</small>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="card stat-card">
            <div class="card-body">
              <div class="d-flex align-items-center">
                <div class="stat-icon bg-info">
                  <i class="bi bi-graph-up text-white"></i>
                </div>
                <div class="ms-3">
                  <h5 class="mb-0">{{ stats.revenue | currency:'CNY' }}</h5>
                  <small class="text-muted">总价值</small>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-lg-8 mb-4">
          <div class="card">
            <div class="card-header">
              <h6 class="card-title mb-0">最近添加的产品</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>产品名称</th>
                      <th>价格</th>
                      <th>库存</th>
                      <th>状态</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr *ngFor="let product of recentProducts">
                      <td>{{ product.name }}</td>
                      <td>{{ product.price | currency:'CNY' }}</td>
                      <td>{{ product.stock }}</td>
                      <td>
                        <span class="status-badge" 
                              [class]="product.status === 1 ? 'status-active' : 'status-inactive'">
                          {{ product.status === 1 ? '正常' : '下架' }}
                        </span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-4 mb-4">
          <div class="card">
            <div class="card-header">
              <h6 class="card-title mb-0">快速操作</h6>
            </div>
            <div class="card-body">
              <div class="d-grid gap-2">
                <a href="/users" class="btn btn-primary">
                  <i class="bi bi-person-plus"></i>
                  添加用户
                </a>
                <a href="/products" class="btn btn-success">
                  <i class="bi bi-plus-circle"></i>
                  添加产品
                </a>
                <a href="http://localhost:8080/swagger/index.html" 
                   target="_blank" 
                   class="btn btn-info">
                  <i class="bi bi-file-earmark-text"></i>
                  查看API文档
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  `,
  styles: [`
    .page-title {
      color: var(--dark-color);
      font-weight: 600;
    }
    
    .stat-card {
      transition: transform 0.2s ease;
    }
    
    .stat-card:hover {
      transform: translateY(-5px);
    }
    
    .stat-icon {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
    }
    
    .card-title {
      color: var(--dark-color);
      font-weight: 600;
    }
    
    .btn i {
      margin-right: 8px;
    }
  `]
})
export class DashboardComponent implements OnInit {
  stats = {
    totalUsers: 0,
    totalProducts: 0,
    lowStockProducts: 0,
    revenue: 0
  };
  
  recentProducts: any[] = [];
  
  constructor(
    private userService: UserService,
    private productService: ProductService
  ) {}
  
  ngOnInit() {
    this.loadDashboardData();
  }
  
  loadDashboardData() {
    // 加载用户统计
    this.userService.getUsers(1, 1000).subscribe({
      next: (response) => {
        this.stats.totalUsers = response.pagination.total;
      },
      error: (error) => console.error('加载用户数据失败:', error)
    });
    
    // 加载产品统计
    this.productService.getProducts(1, 1000).subscribe({
      next: (response) => {
        this.stats.totalProducts = response.pagination.total;
        this.stats.lowStockProducts = response.data.filter(p => p.stock < 10).length;
        this.stats.revenue = response.data.reduce((sum, p) => sum + (p.price * p.stock), 0);
        this.recentProducts = response.data.slice(0, 5);
      },
      error: (error) => console.error('加载产品数据失败:', error)
    });
  }
} 