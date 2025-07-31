export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  stock: number;
  category: string;
  status: number;
  created_at: string;
  updated_at: string;
}

export interface CreateProductRequest {
  name: string;
  description?: string;
  price: number;
  stock?: number;
  category?: string;
}

export interface UpdateProductRequest {
  name?: string;
  description?: string;
  price?: number;
  stock?: number;
  category?: string;
  status?: number;
}

export interface ProductListResponse {
  code: number;
  message: string;
  data: Product[];
  pagination: PaginationInfo;
}

export interface SingleProductResponse {
  code: number;
  message: string;
  data: Product;
}

export interface PaginationInfo {
  page: number;
  page_size: number;
  total: number;
} 