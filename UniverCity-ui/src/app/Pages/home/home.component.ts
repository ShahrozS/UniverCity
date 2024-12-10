import { Component, ViewChild } from '@angular/core';
import { UniversityByProgramListComponent } from '../university-by-program-list/university-by-program-list.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent {
  @ViewChild(UniversityByProgramListComponent) universityListComponent!: UniversityByProgramListComponent;

  onFiltersChanged({ filters, rangedValues }: { filters: any, rangedValues: number[] }): void {
    console.log('Filters updated:', filters);
    console.log('Ranged Values:', rangedValues);

    // Pass filters and ranged values directly to UniversityByProgramListComponent
    if (this.universityListComponent) {
      this.universityListComponent.applyFilters(filters, rangedValues);
    }
  }
}
