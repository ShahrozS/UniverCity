import { Injectable } from '@angular/core';
import {JwtHelperService} from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})
export class TokenService {

  set token(token: string) {
    localStorage.setItem('authToken', token);
  }

  get token() {
    return localStorage.getItem('authToken') as string;
  }

  isTokenValid() {
    const token = this.token;
    console.log("In is token valid: " + token );
    if (!token) {
      return false;
    }
    const jwtHelper = new JwtHelperService();
    const isTokenExpired = jwtHelper.isTokenExpired(token);
    if (isTokenExpired) {
      localStorage.clear();
      return false;
    }
    return true;
  }

  isTokenNotValid() {
    return !this.isTokenValid();
  }

  get userRoles(): string[] {
    const token = this.token;
    if (token) {
      const jwtHelper = new JwtHelperService();
      const decodedToken = jwtHelper.decodeToken(token);
      console.log(decodedToken.authorities);
      return decodedToken.authorities;
    }
    return [];
  }
}
