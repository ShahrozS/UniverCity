import { Component } from '@angular/core';
import {RegistrationRequest} from '../../Services/models/registration-request';
import {Router} from '@angular/router';
import {AuthenticationService} from '../../Services/services/authentication.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent {

  registerRequest: RegistrationRequest = {email:'' , firstName: '', lastName:'',password:'',phoneNumber:'+92'}
  errorMsg: Array<string> = [];
  constructor(
    private router: Router,
    private authService: AuthenticationService,
  ) {
  }



  register() {
    this.errorMsg = [];
    this.authService.register({
      body: this.registerRequest
    }).subscribe({
      next: () => {
        this.router.navigate(['activate-account']);
      },
      error: (err) => {
        // Add a defensive check
        if (err?.error?.validationErrors) {
          this.errorMsg = err.error.validationErrors;
        } else {
          // Handle unexpected errors
          this.errorMsg = ['An unexpected error occurred. Please try again later.'];
          console.error('Error details:', err); // Log for debugging
        }
      }
    });
  }

  login(){
    this.router.navigate(['login']);

  }

}
