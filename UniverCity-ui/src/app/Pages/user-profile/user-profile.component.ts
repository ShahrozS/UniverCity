// user-profile.component.ts
import { Component, OnInit } from '@angular/core';
import { UserService } from '../../Services/services';
import { UserDetailDto } from '../../Services/models';
import { updateUserDetails } from '../../Services/fn/user/update-user-details';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements OnInit {
  user?: UserDetailDto;
  loading = true;
  error: string | null = null;
  editMode = false;
  
  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.loadUserProfile();
  }

  loadUserProfile(): void {
    this.loading = true;
    this.userService.getUserDetails().subscribe({
      next: (userData) => {
        this.user = userData;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load user profile';
        this.loading = false;
        console.error(err);
      }
    });
  }

  toggleEditMode(): void {
    this.editMode = !this.editMode;
  }

  saveProfile(): void {
    const updateUserDetails = this.user!
    this.userService.updateUserDetails({body: updateUserDetails}).subscribe({
      next: (updatedUser) => {
        this.user = updatedUser;
        this.editMode = false;
      },
      error: (err) => {
        console.error('Failed to update profile', err);
      }
    });
  }
}