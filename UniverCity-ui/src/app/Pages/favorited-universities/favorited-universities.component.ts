// favorited-universities.component.ts
import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { animate, style, transition, trigger } from '@angular/animations';
import { University } from '../../Services/models';
import { AuthenticationService, FavouritesService, UniversityService } from '../../Services/services';
import { Router } from '@angular/router';

@Component({
  selector: 'app-favorited-universities',
  templateUrl: './favorited-universities.component.html',
  styleUrls: ['./favorited-universities.component.scss'],
  animations: [
    trigger('fadeIn', [
      transition(':enter', [
        style({ opacity: 0, transform: 'translateY(10px)' }),
        animate('300ms ease-in', style({ opacity: 1, transform: 'translateY(0)' }))
      ])
    ])
  ]
})
export class FavoritedUniversitiesComponent implements OnInit {
  favoritedUniversities: University[] = [];
  loading = true;
  error = false;

  constructor(
    private universityService: UniversityService,
    private authService: AuthenticationService,
    private favService: FavouritesService,
    private router: Router,
    private cdRef: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.loadFavoritedUniversities();
  }

  loadFavoritedUniversities(): void {
    this.favService.getFavorites().subscribe(
      (universities) => {
        this.favoritedUniversities = universities;
        this.loading = false;
      },
      (error) => {
        console.error('Error loading favorited universities', error);
        this.error = true;
        this.loading = false;
      }
    );
  }

  removeFavorite(universityId: number): void {
    this.favService.removeFavorite({ universityId }).subscribe(
      () => {
        // ✅ Update the list to remove the clicked university
        this.favoritedUniversities = this.favoritedUniversities.filter(
          university => university.id !== universityId
        );
  
        // ✅ Force UI refresh
        this.cdRef.detectChanges();
      },
      (error) => {
        console.error('Error removing university from favorites', error);
      }
    );
  }
  
  

  getTimeLeft(applyDate: string): string {
    const today = new Date();
    const applicationDate = new Date(applyDate);
    const timeLeft = applicationDate.getTime() - today.getTime();
    const daysLeft = Math.ceil(timeLeft / (1000 * 3600 * 24));
    
    if (daysLeft < 0) {
      return 'Closed';
    } else if (daysLeft === 0) {
      return 'Last day!';
    } else {
      return `${daysLeft} days left`;
    }
  }

  formatDateToString(date:string): string {
    if (!date) return 'N/A';
    return new Date(date).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric'
    });
  }


  getTimeLeftMessage(applyDate: string | null): string {
    if (!applyDate) return "N/A"; 
  
    const timeLeft = this.getTimeLeft(applyDate); // Store the computed value
    return timeLeft;
  }
  formatStringToDate(dateString: string | null): string {
    if (!dateString) return "N/A"; // Handle empty values
  
    const date = new Date(dateString); // Convert string to Date
    return date.toLocaleDateString(); // Adjust format as needed
  }
  
}