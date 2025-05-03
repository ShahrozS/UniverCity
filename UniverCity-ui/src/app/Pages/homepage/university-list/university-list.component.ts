
import { Program } from '../../../Services/models/program';
import { ChangeDetectorRef, Component, Input, OnChanges, SimpleChanges } from '@angular/core';
import { UniversityCardComponent } from '../university-card/university-card.component';
import { CommonModule } from '@angular/common';
import { UniversityService } from '../../../Services/services/university.service';
import { Router, ActivatedRoute } from '@angular/router';
import { PageResponseUniversityResponse } from '../../../Services/models/page-response-university-response';
import { UniversityFilterService } from '../../../Services/services/university-filter.service';
import { HttpContext } from '@angular/common/http';
import { University } from '../../../Services/models/university';
import { FilterInstitutions$Params } from '../../../Services/fn/university/filter-institutions';
import { SearchUniversities$Params } from '../../../Services/fn/university/search-universities';
@Component({
  selector: 'app-university-list',
  templateUrl: './university-list.component.html',
  styleUrls: ['./university-list.component.scss']
})
export class UniversityListComponent {
  universities: University[] = [];
  selectedUniversities: University[] = [];
  uniProgram: string;
  loading: boolean = true; // Track loading state

  // Pagination parameters
  currentPage: number = 0;
  pageSize: number = 10;
  totalElements: number = 0;
  totalPages: number = 0;
  isFirstPage: boolean = true;
  isLastPage: boolean = false;

  filteredUniversities: University[] = []; // Start with empty array to hold filtered results
  @Input() filter: any; // The filter input

  constructor(
    private universityListService: UniversityService,
    private router: Router,
    private route: ActivatedRoute,
    private universityFilterService: UniversityFilterService,
    private cdr: ChangeDetectorRef
  ) {
    this.uniProgram = 'temp';
    this.fetchUniversitiesByProgram(this.uniProgram);
    console.log("Here");
  }

  fetchUniversitiesByProgram(name: string): void {
    this.loading = true; // Start loading

    // Fetch universities by program with pagination
    this.universityListService.findAllUniversity({page:this.currentPage, size:this.pageSize}).subscribe(
      (response: PageResponseUniversityResponse) => {
        console.log("Universities loaded successfully");
        this.universities = response.content ?? []; // Use nullish coalescing to handle undefined
        this.filteredUniversities = this.universities;
        
        // Set pagination data
        this.currentPage = response.number!;
        this.pageSize = response.size!;
        this.totalElements = response.totalElements!;
        this.totalPages = response.totalPages!;
        this.isFirstPage = response.first!;
        this.isLastPage = response.last!;
        
        this.loading = false; // Stop loading after universities are fetched
      },
      (error) => {
        console.error('Error fetching universities by program:', error);
        this.loading = false; // Stop loading even if an error occurs
      }
    );
  }

  // Pagination methods
  goToPage(page: number): void {
    if (page >= 0 && page < this.totalPages) {
      this.currentPage = page;
      this.fetchUniversitiesByProgram(this.uniProgram);
    }
  }

  nextPage(): void {
    if (!this.isLastPage) {
      this.currentPage++;
      this.fetchUniversitiesByProgram(this.uniProgram);
    }
  }

  previousPage(): void {
    if (!this.isFirstPage) {
      this.currentPage--;
      this.fetchUniversitiesByProgram(this.uniProgram);
    }
  }

  applyFilters(filters: any, rangedVal: number[]): void  {
    console.log('Filters applied:', filters);
    this.loading = true;
  
    const filterParams: FilterInstitutions$Params = {
      filter: {
        cities: filters.location ?? [],
        accreditationBodies: filters.accreditationBody ?? [],
        minFees: rangedVal?.[0] ?? 20000,
        maxFees: rangedVal?.[1] ?? 300000,
        program: filters.program ?? []
      },
    };
  
    this.universityListService.filterInstitutions(filterParams).subscribe(
      (response: University[]) => {
        console.log('✅ Filtered universities:', response);
  
        this.filteredUniversities = [...response]; // 🔥 Force array reference change
        this.loading = false;
  
        this.cdr.detectChanges(); // 🔥 Force UI update
      },
      (error) => {
        console.error('❌ Error applying filters:', error);
        this.loading = false;
      }
    );
  }
  
  searchUniversities(keyword: string) {
    this.loading = true; // Start loading

    const ser: SearchUniversities$Params = {
      keyword: keyword || ''
    }
    this.universityListService.searchUniversities(ser).subscribe(
      (response: University[]) => {
        console.log('Filtered universities:', response);
        this.filteredUniversities = response;
        this.loading = false; // Stop loading even if an error occurs
      },
      (error) => {
        console.error('Error applying filters:', error);
        this.loading = false; // Stop loading even if an error occurs
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
      this.router.navigate(['/compare-universities'], {
        queryParams: {
          university1: JSON.stringify(this.selectedUniversities[0]),
          university2: JSON.stringify(this.selectedUniversities[1])
        }
      });
    }
  }
  
  trackByUniversity(index: number, university: University) {
    return university?.id || index; // Use a unique ID if available
  }
}