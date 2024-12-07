import { Component } from '@angular/core';
import { UniversityCardComponent } from '../university-card/university-card.component';
import { CommonModule } from '@angular/common';
import { UniversityService } from '../../Services/services/university.service';
import { Router } from '@angular/router';
import { University } from '../../Services/models/university';

@Component({
  selector: 'app-favorite-universities',
  templateUrl: './favorite-universities.component.html',
  styleUrl: './favorite-universities.component.scss',
  standalone: true,
  imports: [UniversityCardComponent]
})
export class FavoriteUniversitiesComponent {
  universities: University[] = []; // List of universities
  filteredUniversities: University[] = []; // Filtered universities
  selectedUniversities: University[] = []; // Selected universities for comparison


  constructor(
    private universityService: UniversityService,
    private router: Router,
  ) {
    


    this.fetchUniversitiesByProgram();
  }

  /**
   * Fetch universities by user favorites
   */
  fetchUniversitiesByProgram(): void {
    //replace with find universities by user favorites
    this.universityService.findAllUniversity().subscribe(
      (response) => {
        // Assuming the `content` field contains the list of universities
        const universityResponses = response.content || [];
        this.universities = universityResponses.map((u) =>
          this.mapToUniversity(u)
        );
        this.filteredUniversities = this.universities;
        console.log('Fetched universities:', this.universities);
      },
      (error) => {
        console.error('Error fetching universities:', error);
      }
    );
  }

  /**
   * Map a `UniversityResponse` object to a `University` object.
   */
  private mapToUniversity(response: any): University {
    return {
      id: response.university_id,
      name: response.name,
      about: response.about,
      accrediatetionBody: response.accrediatetionBody,
      applyDate: response.applyDate,
      averageFees: response.averageFees,
      rank: response.rank,
      startDate: response.startDate,
      websiteLink: response.websiteLink,
    };
  }

  /**
   * Handles card selection change events.
   * Allows selecting up to two universities for comparison.
   */
  onCardSelectionChange(event: { isSelected: boolean; university: University }) {
    if (event.isSelected) {
      if (this.selectedUniversities.length < 2) {
        this.selectedUniversities.push(event.university);
      } else {
        alert('You can only select two universities to compare.');
        event.isSelected = false;
      }
    } else {
      this.selectedUniversities = this.selectedUniversities.filter(
        (u) => u !== event.university
      );
    }
  }

  /**
   * Navigates to the comparison page with the selected universities.
   */
  compareUniversities(): void {
    if (this.selectedUniversities.length === 2) {
      this.router.navigate(['/compare-university'], {
        queryParams: {
          university1: JSON.stringify(this.selectedUniversities[0]),
          university2: JSON.stringify(this.selectedUniversities[1]),
        },
      });
    }
  }
}
