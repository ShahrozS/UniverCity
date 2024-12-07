import { UniversityFilter } from './../../Services/models/university-filter';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UniversityService } from '../../Services/services/university.service';
import { FilterInstitutions$Params } from '../../Services/fn/university/filter-institutions';
import { University } from '../../Services/models/university';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-university-filter',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './university-filter.component.html',
  styleUrls: ['./university-filter.component.css']
})
export class UniversityFilterComponent {
  universities: University[] = [];
  filter: FilterInstitutions$Params = { filter : {}};
  loading = false;
  error: string | null = null;

  constructor(private universityService: UniversityService) {}

  applyFilters() {
    this.loading = true;
    this.error = null;

    this.universityService.filterInstitutions(this.filter).subscribe(
      (data) => {
        this.universities = data;
        this.loading = false;
      },
      (err) => {
        this.error = 'Failed to load universities';
        this.loading = false;
      }
    );
  }

  resetFilters() {
    this.filter = { filter : {}};
    this.universities = [];
  }
}
