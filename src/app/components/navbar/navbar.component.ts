import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule],
  template: `
    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
      <div class="container-fluid">
        <button class="btn btn-outline-secondary d-md-none" 
                type="button" 
                (click)="toggleSidebar()">
          <i class="bi bi-list"></i>
        </button>
        
        <span class="navbar-brand mb-0 h1 ms-3">后台管理系统</span>
        
        <div class="navbar-nav ms-auto">
          <div class="nav-item dropdown">
            <a class="nav-link dropdown-toggle d-flex align-items-center" 
               href="#" 
               id="navbarDropdown" 
               role="button" 
               data-bs-toggle="dropdown">
              <img src="https://via.placeholder.com/32x32" 
                   class="rounded-circle me-2" 
                   alt="头像">
              管理员
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li><a class="dropdown-item" href="#"><i class="bi bi-person"></i> 个人资料</a></li>
              <li><a class="dropdown-item" href="#"><i class="bi bi-gear"></i> 设置</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right"></i> 退出登录</a></li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  `,
  styles: [`
    .navbar-custom {
      background-color: white;
      border-bottom: 1px solid #dee2e6;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .navbar-brand {
      color: var(--dark-color);
      font-weight: 600;
    }
    
    .nav-link {
      color: var(--dark-color);
    }
    
    .nav-link:hover {
      color: var(--primary-color);
    }
    
    .dropdown-item i {
      margin-right: 8px;
      width: 16px;
    }
  `]
})
export class NavbarComponent {
  toggleSidebar() {
    // 移动端侧边栏切换逻辑
    const sidebar = document.querySelector('.sidebar');
    sidebar?.classList.toggle('show');
  }
} 