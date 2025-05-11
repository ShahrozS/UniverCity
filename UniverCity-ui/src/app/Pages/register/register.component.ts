import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { RegistrationRequest } from '../../Services/models/registration-request';
import { Router } from '@angular/router';
import { AuthenticationService } from '../../Services/services/authentication.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrl: './register.component.scss'
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup = new FormGroup({});
  registerRequest: RegistrationRequest = { email: '', firstName: '', lastName: '', password: '', phoneNumber: '+92' };
  errorMsg: Array<string> = [];
  passwordVisible: boolean = false;
  submitted: boolean = false;

  constructor(
    private router: Router,
    private authService: AuthenticationService,
    private fb: FormBuilder
  ) { }

  ngOnInit(): void {
    this.initializeForm();
  }

  initializeForm(): void {
    this.registerForm = this.fb.group({
      firstName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(50)]],
      lastName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(50)]],
      phoneNumber: ['+92', [Validators.required, this.phoneNumberValidator]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [
        Validators.required,
        Validators.minLength(8),
        this.passwordStrengthValidator
      ]],
      confirmPassword: ['', Validators.required],
      rememberMe: [false]
    }, {
      validators: this.passwordMatchValidator
    });
  }

  // Custom validator for password strength
  passwordStrengthValidator(control: AbstractControl): ValidationErrors | null {
    const value = control.value;
    if (!value) {
      return null;
    }

    const hasUpperCase = /[A-Z]+/.test(value);
    const hasLowerCase = /[a-z]+/.test(value);
    const hasNumeric = /[0-9]+/.test(value);
    const hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(value);

    const passwordValid = hasUpperCase && hasLowerCase && hasNumeric && hasSpecialChar;

    return !passwordValid ? { passwordStrength: true } : null;
  }

  // Custom validator for matching passwords
  passwordMatchValidator(control: AbstractControl): ValidationErrors | null {
    const password = control.get('password');
    const confirmPassword = control.get('confirmPassword');

    if (password && confirmPassword && password.value !== confirmPassword.value) {
      confirmPassword.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    }
    return null;
  }

  // Custom validator for phone number
  phoneNumberValidator(control: AbstractControl): ValidationErrors | null {
    const value = control.value;
    if (!value) {
      return null;
    }
    
    // Basic international phone format validation (starts with + and has 7-15 digits)
    const valid = /^\+[0-9]{7,15}$/.test(value);
    return valid ? null : { invalidPhoneNumber: true };
  }

  // Convenience getter for easy access to form fields
  get f():any { return this.registerForm?.controls; }

  togglePasswordVisibility(): void {
    this.passwordVisible = !this.passwordVisible;
  }

  getPasswordStrength(): { strength: string, color: string } {
    const password = this.f['password'].value;
    if (!password) {
      return { strength: 'None', color: 'gray' };
    }

    let strength = 0;
    if (password.length >= 8) strength++;
    if (/[A-Z]+/.test(password)) strength++;
    if (/[a-z]+/.test(password)) strength++;
    if (/[0-9]+/.test(password)) strength++;
    if (/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(password)) strength++;

    switch (strength) {
      case 1: return { strength: 'Very Weak', color: 'red' };
      case 2: return { strength: 'Weak', color: 'orange' };
      case 3: return { strength: 'Medium', color: 'yellow' };
      case 4: return { strength: 'Strong', color: 'lightgreen' };
      case 5: return { strength: 'Very Strong', color: 'green' };
      default: return { strength: 'None', color: 'gray' };
    }
  }

  register(): void {
    this.submitted = true;
    this.errorMsg = [];

    // Stop here if form is invalid
    if (this.registerForm?.invalid) {
      // Collect validation errors
      Object.keys(this.registerForm.controls).forEach(key => {
        const controlErrors = this.registerForm?.get(key)?.errors;
        if (controlErrors) {
          if (key === 'firstName' && controlErrors['required']) {
            this.errorMsg.push('First name is required');
          }
          if (key === 'lastName' && controlErrors['required']) {
            this.errorMsg.push('Last name is required');
          }
          if (key === 'email') {
            if (controlErrors['required']) this.errorMsg.push('Email is required');
            if (controlErrors['email']) this.errorMsg.push('Please enter a valid email address');
          }
          if (key === 'phoneNumber' && controlErrors['invalidPhoneNumber']) {
            this.errorMsg.push('Please enter a valid phone number with country code (e.g., +921234567890)');
          }
          if (key === 'password') {
            if (controlErrors['required']) this.errorMsg.push('Password is required');
            if (controlErrors['minlength']) this.errorMsg.push('Password must be at least 8 characters long');
            if (controlErrors['passwordStrength']) this.errorMsg.push('Password must include uppercase, lowercase, number, and special character');
          }
        }
      });

      // Check for password mismatch
      if (this.registerForm.hasError('passwordMismatch')) {
        this.errorMsg.push('Passwords do not match');
      }
      
    console.log("here");

      return;
    }



    // Map form values to request model
    this.registerRequest = {
      firstName: this.f['firstName'].value,
      lastName: this.f['lastName'].value,
      email: this.f['email'].value,
      password: this.f['password'].value,
      phoneNumber: this.f['phoneNumber'].value
    };

    console.log("after return " , this.registerRequest);

    this.authService.register({
      body: this.registerRequest
    }).subscribe({
      next: () => {
    console.log("after next");

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

  login(): void {
    this.router.navigate(['login']);
  }
}