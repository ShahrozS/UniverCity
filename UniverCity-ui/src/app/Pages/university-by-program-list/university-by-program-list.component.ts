import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { UniversityCardComponent } from '../university-card/university-card.component';
import { CommonModule } from '@angular/common';
import { UniversityService } from '../../Services/services/university.service';
import { Router, ActivatedRoute } from '@angular/router';
import { PageResponseUniversityResponse } from '../../Services/models/page-response-university-response';
import { UniversityFilterService } from '../../Services/services/university-filter.service';
import { HttpContext } from '@angular/common/http';
import { University } from '../../Services/models/university';
import { FilterInstitutions$Params } from '../../Services/fn/university/filter-institutions';

@Component({
  selector: 'app-university-by-program-list',
  standalone: true,
  imports: [UniversityCardComponent, CommonModule],
  templateUrl: './university-by-program-list.component.html',
  styleUrls: ['./university-by-program-list.component.scss']
})
export class UniversityByProgramListComponent implements OnChanges {
  universities: University[] = [];
  selectedUniversities: University[] = [];
  uniProgram: string;

  filteredUniversities: University[] = []; // Start with empty array to hold filtered results
  @Input() filter: any; // The filter input

  constructor(
    private universityListService: UniversityService,
    private router: Router,
    private route: ActivatedRoute,
    private universityFilterService: UniversityFilterService
  ) {
    this.uniProgram = 'temp';
    this.fetchUniversitiesByProgram(this.uniProgram);
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['filter'] && this.filter) {
      // Whenever the filter input changes, we filter the universities
      this.applyFilters();
    }
  }

  fetchUniversitiesByProgram(name: string): void {
    // Fetch universities by program (for now, mock the response)
    const filterParams: FilterInstitutions$Params = {
      filter : {
        cities: this.filter?.location ?? [],
        accreditationBodies: this.filter?.accreditationBody ?? [],
        //discipline: this.filter?.discipline ?? []
      }
      
      
      
    };

    this.universityListService.findAllUniversity().subscribe(
      (response: PageResponseUniversityResponse) => {
        this.universities = response.content ?? []; // Use nullish coalescing to handle undefined
        console.log(this.universities[1]?.name); // Safely access properties
        this.filteredUniversities = this.universities; // Apply filtering after setting the array
      },
      (error) => {
        console.error('Error fetching universities by program:', error);
      }
    );

    /*

this.universityListService.filterInstitutions(filterParams).subscribe(
      (response: University[]) => {
        this.universities = response;
        this.filteredUniversities = [...this.universities]; // Initially, no filter applied
      },
      (error) => {
        console.error('Error fetching universities:', error);
      }
    );
    */

    // Call the service to get filtered universities based on parameters
    
  }

  applyFilters(): void {
    if (this.filter) {
      // Update the parameters based on selected filters
      const filterParams: FilterInstitutions$Params = {
        filter : {
          cities: this.filter?.location ?? [],
          accreditationBodies: this.filter?.accreditationBody ?? [],
          //discipline: this.filter?.discipline ?? []
        }
      };

      // Fetch filtered universities
      this.universityListService.filterInstitutions(filterParams).subscribe(
        (response: University[]) => {
          this.filteredUniversities = response;
        },
        (error) => {
          console.error('Error applying filters:', error);
        }
      );
    }
  }

  onCardSelectionChange(event: any) {
    if (event.isSelected) {
      if (this.selectedUniversities.length < 2) {
        this.selectedUniversities.push(event.university);
      } else {
        alert('You can only select two universities to compare.');
        event.isSelected = false;
      }
    } else {
      this.selectedUniversities = this.selectedUniversities.filter(
        u => u !== event.university
      );
    }
  }

  compareUniversities() {
    if (this.selectedUniversities.length === 2) {
      this.router.navigate(['/compare-university'], {
        queryParams: {
          university1: JSON.stringify(this.selectedUniversities[0]),
          university2: JSON.stringify(this.selectedUniversities[1])
        }
      });
    }
  }
}
