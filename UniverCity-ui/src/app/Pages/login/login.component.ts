import { Component } from '@angular/core';
import {AuthenticationRequest} from "../../Services/models/authentication-request";
import {Router} from "@angular/router";
import {AuthenticationService} from "../../Services/services/authentication.service";
import {AuthenticationResponse} from "../../Services/models/authentication-response";
import {TokenService} from '../../Services/token/token.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent {

  authRequest: AuthenticationRequest = {email: '', password: ''};
  errorMsg: Array<string> = [];

  constructor(
      private router: Router,
      private authService: AuthenticationService,
     private tokenService: TokenService
  ) {
  }

  login() {
    console.log("Hello");
    this.errorMsg = [];
    this.authService.authenticate({ body: this.authRequest }).subscribe({
      next: (res: AuthenticationResponse) => {
        if (res && res.token) {
          console.log('Successful login:', res);

          this.tokenService.token = res.token as string;

          this.router.navigate(['home']);
          // Example: Storing the token in localStorage after login

        } else {
          console.log('Login failed:', res);
          this.errorMsg.push('Invalid credentials or login failed.');
        }
      },
      error: (err) => {
        console.log('Login failed:', err);
        if (err.error.validationErrors) {
          this.errorMsg = err.error.validationErrors;
        } else if (err.error.errorMsg) {
          this.errorMsg.push(err.error.errorMsg);
        } else {
          this.errorMsg.push('An unknown error occurred.');
        }
      }
    });
  }

  register() {
    this.router.navigate(['register']);
  }

}
