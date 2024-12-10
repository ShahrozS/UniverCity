import { Component } from '@angular/core';
import { UniversityByProgramListComponent } from '../university-by-program-list/university-by-program-list.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
  
})
export class HomeComponent {
  rangeValues: number[] = [0, 735]
  selectedFilters: any = {}; // Store filters to pass to the university list

  onFiltersChanged(filters: any): void {
    console.log('Filters updated:', filters);
    this.selectedFilters = filters;
  }
 
}
