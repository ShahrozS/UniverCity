import { Program } from '../../../Services/models/program';
import { Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { UniversityCardComponent } from '../university-card/university-card.component';
import { CommonModule } from '@angular/common';
import { UniversityService } from '../../../Services/services/university.service';
import { Router, ActivatedRoute } from '@angular/router';
import { PageResponseUniversityResponse } from '../../../Services/models/page-response-university-response';
import { UniversityFilterService } from '../../../Services/services/university-filter.service';
import { HttpContext } from '@angular/common/http';
import { University } from '../../../Services/models/university';
import { FilterInstitutions$Params } from '../../../Services/fn/university/filter-institutions';

@Component({
  selector: 'app-university-by-program-list',
  standalone: true,
  imports: [UniversityCardComponent, CommonModule],
  templateUrl: './university-by-program-list.component.html',
  styleUrls: ['./university-by-program-list.component.scss']
})
export class UniversityByProgramListComponent {
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



  fetchUniversitiesByProgram(name: string): void {
    // Fetch universities by program (for now, mock the response)
    const filterParams: FilterInstitutions$Params = {
      filter : {
        cities: this.filter?.location ?? [],
        accreditationBodies: this.filter?.accreditationBody ?? [],
        program: this.filter?.Program ?? []
      }



    };

    this.universityListService.findAllUniversity().subscribe(

      (response: PageResponseUniversityResponse) => {
        console.log("hello");
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

  applyFilters(filters: any, rangedVal: number[]): void  {
    console.log('Filters applied:', filters);

    // Destructure the filter values for easier access
    const { location, accreditationBody,programNames } = filters?.filters || {};


    // Define the filter parameters including the range for fees
    const filterParams: FilterInstitutions$Params = {
      filter: {
        cities: filters.location ?? [],
        accreditationBodies: filters.accreditationBody ?? [],
        minFees: rangedVal?.[0] ?? 20000,  // Default min fee if not provided
        maxFees: rangedVal?.[1] ?? 300000, // Default max fee if not provided
        program: filters.program ?? []
        // Add other filter fields here as needed
      },
    };

    // Call the service to filter universities with the updated filterParams
    this.universityListService.filterInstitutions(filterParams).subscribe(
      (response: University[]) => {
        console.log('Filtered universities:', response);
        this.filteredUniversities = response;
      },
      (error) => {
        console.error('Error applying filters:', error);
      }
    );
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
