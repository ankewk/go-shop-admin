import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpService } from './http.service';
import { 
  User, 
  CreateUserRequest, 
  UpdateUserRequest, 
  UserListResponse, 
  SingleUserResponse 
} from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  constructor(private httpService: HttpService) {}

  getUsers(page: number = 1, pageSize: number = 10): Observable<UserListResponse> {
    return this.httpService.get<UserListResponse>('/users', { 
      page, 
      page_size: pageSize 
    });
  }

  getUserById(id: number): Observable<SingleUserResponse> {
    return this.httpService.get<SingleUserResponse>(`/users/${id}`);
  }

  createUser(user: CreateUserRequest): Observable<SingleUserResponse> {
    return this.httpService.post<SingleUserResponse>('/users', user);
  }

  updateUser(id: number, user: UpdateUserRequest): Observable<SingleUserResponse> {
    return this.httpService.put<SingleUserResponse>(`/users/${id}`, user);
  }

  deleteUser(id: number): Observable<any> {
    return this.httpService.delete<any>(`/users/${id}`);
  }
} 