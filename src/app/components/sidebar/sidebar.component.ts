import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <nav class="sidebar">
      <div class="sidebar-header">
        <h4 class="text-white text-center py-3">
          <i class="bi bi-shop"></i>
          Go Shop Admin
        </h4>
      </div>
      
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" routerLink="/dashboard" routerLinkActive="active">
            <i class="bi bi-speedometer2"></i>
            仪表板
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" routerLink="/users" routerLinkActive="active">
            <i class="bi bi-people"></i>
            用户管理
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" routerLink="/products" routerLinkActive="active">
            <i class="bi bi-box"></i>
            产品管理
          </a>
        </li>
        
        <li class="nav-item mt-auto">
          <a class="nav-link" href="http://localhost:8080/swagger/index.html" target="_blank">
            <i class="bi bi-file-earmark-text"></i>
            API 文档
          </a>
        </li>
      </ul>
    </nav>
  `,
  styles: [`
    .sidebar {
      background-color: var(--dark-color);
      padding: 0;
    }
    
    .sidebar-header {
      border-bottom: 1px solid rgba(255,255,255,0.1);
    }
    
    .nav-link {
      color: rgba(255,255,255,0.8);
      padding: 12px 20px;
      border-radius: 0;
      transition: all 0.3s ease;
    }
    
    .nav-link:hover,
    .nav-link.active {
      background-color: var(--primary-color);
      color: white;
    }
    
    .nav-link i {
      margin-right: 10px;
      width: 20px;
    }
    
    .nav {
      padding: 20px 0;
      height: calc(100vh - 80px);
      display: flex;
      flex-direction: column;
    }
  `]
})
export class SidebarComponent {} 