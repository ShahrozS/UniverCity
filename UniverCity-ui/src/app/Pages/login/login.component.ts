import { Component, OnInit } from '@angular/core';
import { AuthenticationRequest } from "../../Services/models/authentication-request";
import { Router } from "@angular/router";
import { AuthenticationService } from "../../Services/services/authentication.service";
import { AuthenticationResponse } from "../../Services/models/authentication-response";
import { TokenService } from '../../Services/token/token.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {
  authRequest: AuthenticationRequest = {email: '', password: ''};
  errorMsg: Array<string> = [];
  loginForm: FormGroup;
  submitted = false;
  passwordVisible = false;

  constructor(
    private formBuilder: FormBuilder,
    private router: Router,
    private authService: AuthenticationService,
    private tokenService: TokenService
  ) {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      rememberMe: [false]
    });
  }

  ngOnInit(): void {
    // Form is now initialized in the constructor
  }

  // Convenience getter for form fields
  get f() {
    return this.loginForm.controls;
  }

  // Add password visibility toggle function
  togglePasswordVisibility(): void {
    this.passwordVisible = !this.passwordVisible;
  }

  login(): void {
    this.submitted = true;
    this.errorMsg = [];
    
    // Stop here if form is invalid
    if (this.loginForm.invalid) {
      return;
    }

    // Map form values to auth request
    this.authRequest = {
      email: this.loginForm.value.email,
      password: this.loginForm.value.password
    };

    this.authService.authenticate({ body: this.authRequest }).subscribe({
      next: (res: AuthenticationResponse) => {
        if (res && res.token) {
          console.log('Successful login:', res);
          this.tokenService.token = res.token as string;
          
          // Store token in localStorage if "Remember me" is checked
          if (this.loginForm.value.rememberMe) {
            localStorage.setItem('auth_token', res.token as string);
          }
          
          this.router.navigate(['home']);
        } else {
          console.log('Login failed: No token received');
          this.errorMsg.push('Invalid credentials or login failed.');
        }
      },
      error: (err) => {
        console.error('Login error:', err);
        
        if (err.error?.validationErrors && Array.isArray(err.error.validationErrors)) {
          this.errorMsg = err.error.validationErrors;
        } else if (err.error?.errorMsg) {
          this.errorMsg.push(err.error.errorMsg);
        } else if (err.status === 401) {
          this.errorMsg.push('Invalid email or password.');
        } else if (err.status === 0) {
          this.errorMsg.push('Unable to connect to server. Please try again later.');
        } else {
          this.errorMsg.push('An unexpected error occurred. Please try again.');
        }
      }
    });
  }

  register(): void {
    this.router.navigate(['register']);
  }
}