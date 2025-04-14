import { Component } from '@angular/core';
import { faSignOut,faUser } from '@fortawesome/free-solid-svg-icons';
import {Router} from '@angular/router';
import {AuthenticationService} from '../../Services/services/authentication.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.scss'
})
export class NavbarComponent {
faSignOut = faSignOut;
faUser = faUser;

  constructor(
    private router: Router,
    // another service
  ) {
  }
  logout() {
    localStorage.removeItem('authToken');
    window.location.reload();

    // this.router.navigate(['login']);

  }

  home() {
    this.router.navigate(['home']);
  }
}
