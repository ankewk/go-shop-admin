export interface User {
  id: number;
  name: string;
  email: string;
  phone?: string;
  avatar?: string;
  status: number;
  created_at: string;
  updated_at: string;
}

export interface CreateUserRequest {
  name: string;
  email: string;
  phone?: string;
}

export interface UpdateUserRequest {
  name?: string;
  email?: string;
  phone?: string;
}

export interface UserListResponse {
  code: number;
  message: string;
  data: User[];
  pagination: PaginationInfo;
}

export interface SingleUserResponse {
  code: number;
  message: string;
  data: User;
}

export interface PaginationInfo {
  page: number;
  page_size: number;
  total: number;
} 