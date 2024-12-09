import { Component } from '@angular/core';
import { DropDownAnimation } from './animations';

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

    if (index > -1) {
      // Remove filter if already exists
      this.filters[filterType] = currentFilters.filter(f => f !== value);
    } else {
      // Add filter
      this.filters[filterType] = [...currentFilters, value];
    }

    console.log(`${filterType} filters:`, this.filters[filterType]);
  }




  clearFilter(): void {
    // Reset all dropdowns to closed
    Object.keys(this.dropdowns).forEach(key => {
      this.dropdowns[key as keyof Dropdowns] = false;
    });
  }
}