import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpService } from './http.service';
import { 
  Product, 
  CreateProductRequest, 
  UpdateProductRequest, 
  ProductListResponse, 
  SingleProductResponse 
} from '../models/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  constructor(private httpService: HttpService) {}

  getProducts(page: number = 1, pageSize: number = 10): Observable<ProductListResponse> {
    return this.httpService.get<ProductListResponse>('/products', { 
      page, 
      page_size: pageSize 
    });
  }

  getProductById(id: number): Observable<SingleProductResponse> {
    return this.httpService.get<SingleProductResponse>(`/products/${id}`);
  }

  createProduct(product: CreateProductRequest): Observable<SingleProductResponse> {
    return this.httpService.post<SingleProductResponse>('/products', product);
  }

  updateProduct(id: number, product: UpdateProductRequest): Observable<SingleProductResponse> {
    return this.httpService.put<SingleProductResponse>(`/products/${id}`, product);
  }

  deleteProduct(id: number): Observable<any> {
    return this.httpService.delete<any>(`/products/${id}`);
  }
} 