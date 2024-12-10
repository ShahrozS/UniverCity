import { Component, EventEmitter, Output } from '@angular/core';
import { UniversityFilterService } from '../../Services/services';
import { DropDownAnimation } from './animations';

type Dropdowns = {
  location: boolean;
  avgFees: boolean;
  accreditationBody: boolean;
  discipline: boolean;
};

// Define an interface for the emitted object
interface FilterData {
  filters: {
    location: string[];
    accreditationBody: string[];
    program: string[];
  };
  rangedValues: number[];
}

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

  filters: {
    location: string[];
    accreditationBody: string[];
    program: string[];
  } = {
    location: [],
    accreditationBody: [],
    program: []
  };


  cityMenu: string[] = [];
  programMenu: string[] = ['BS - Mathematics','BS - Software Engineering','BS - Aviation Management','BS - Arabic','BS - Chemistry']
  rangedValues: number[] = [20000, 300000]; // Add range values to track min/max

  @Output() filtersChanged = new EventEmitter<FilterData>();

  constructor(private universityFilterService: UniversityFilterService) {
    universityFilterService.getCities().subscribe({
      next: (cities: any[]) => {
        this.cityMenu = cities.map(city => city.name);
      },
      error: (err) => {
        console.error('Failed to fetch cities:', err);
      }
    });
  }

  // Emit range changes
  onRangeChanged(rangedValues: number[]): void {
    this.rangedValues = rangedValues;
    this.emitFilters(); // Emit the filters when the range is updated
  }

  toggleDropdown(filter: keyof Dropdowns, event?: Event): void {
    if (event) {
      event.stopPropagation();
      event.preventDefault();
    }
    this.dropdowns[filter] = !this.dropdowns[filter];
  }

  toggleFilter(filterType: keyof typeof this.filters, value: string, event: Event): void {
    event.stopPropagation();

    const currentFilters = this.filters[filterType];
    const index = currentFilters.indexOf(value);

    if (index > -1) {
      this.filters[filterType] = currentFilters.filter(f => f !== value);
    } else {
      this.filters[filterType] = [...currentFilters, value];
    }

    this.emitFilters(); // Emit filters whenever a filter is changed
  }

  // Emit both filters and ranged values
  private emitFilters(): void {
    this.filtersChanged.emit({
      filters: this.filters,
      rangedValues: this.rangedValues
    });
  }

  clearFilter(): void {
    Object.keys(this.dropdowns).forEach(key => {
      this.dropdowns[key as keyof Dropdowns] = false;
    });
    Object.keys(this.filters).forEach(key => {
      this.filters[key as keyof typeof this.filters] = [];
    });
    this.rangedValues = [20000, 300000]; // Reset the range to default values

    this.emitFilters(); // Emit cleared filters and ranged values
  }



  //filter button

  removeFilter(filterType: keyof typeof this.filters, value: string): void {
    const currentFilters = this.filters[filterType];
    this.filters[filterType] = currentFilters.filter(f => f !== value);

    this.emitFilters(); // Emit updated filters
  }

}
