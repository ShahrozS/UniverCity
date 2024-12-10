
import { City } from './../../Services/models/city';
import { University } from './../../Services/models/university';
import { Component, EventEmitter, Output } from '@angular/core';
import { DropDownAnimation } from './animations';
import { UniversityFilterService } from '../../Services/services';

type Dropdowns = {
  location: boolean;
  avgFees: boolean;
  accreditationBody: boolean;
  discipline: boolean;
};

@Component({
  selector: 'app-filters',
  templateUrl: './filters.component.html',
  styleUrls: ['./filters.component.scss'],
  animations: [DropDownAnimation]
})
export class FiltersComponent {
  dropdowns: Dropdowns = {
    location: false,
    avgFees: false,
    accreditationBody: false,
    discipline: false
  };
  filters = {
    location: [] as string[],
    accreditationBody: [] as string[],
    discipline: [] as string[]
  };
  cityMenu : any[] = [];

  @Output() filtersChanged = new EventEmitter<typeof this.filters>();


  constructor(universityFilterService : UniversityFilterService){
    universityFilterService.getCities().subscribe({
      next: (cities: any[]) => {
        this.cityMenu = cities.map(city => city.name);
      },
      error: (err) => {
        console.error('Failed to fetch cities:', err);
      }
    });
  }





  toggleDropdown(filter: keyof Dropdowns, event?: Event): void {
    // Prevent event propagation to ensure click works correctly
    if (event) {
      event.stopPropagation();
      event.preventDefault();
    }
    this.dropdowns[filter] = !this.dropdowns[filter];
  }


  toggleFilter(filterType: keyof typeof this.filters, value: string, event: Event): void {
    // Prevent dropdown from toggling when interacting with checkboxes
    event.stopPropagation();

    const currentFilters = this.filters[filterType];
    const index = currentFilters.indexOf(value);

    console.log('Before:', this.filters[filterType]); // Log before the change

    if (index > -1) {
      // Remove filter if already exists
      this.filters[filterType] = currentFilters.filter(f => f !== value);
    } else {
      // Add filter
      this.filters[filterType] = [...currentFilters, value];
    }

    console.log(`${filterType} filters:`, this.filters[filterType]); // Log after the change
    this.filtersChanged.emit(this.filters);
  }





  clearFilter(): void {
    // Reset all dropdowns to closed
    Object.keys(this.dropdowns).forEach(key => {
      this.dropdowns[key as keyof Dropdowns] = false;
    });
    Object.keys(this.filters).forEach(key => {
      this.filters[key as keyof typeof this.filters] = [];
    });

    this.filtersChanged.emit(this.filters);

  }
}
