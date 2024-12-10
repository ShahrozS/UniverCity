import { Component, ViewChild } from '@angular/core';
import { UniversityListComponent } from '../university-list/university-list.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent {
  @ViewChild(UniversityListComponent) universityListComponent!: UniversityListComponent;

  onFiltersChanged({ filters, rangedValues }: { filters: any, rangedValues: number[] }): void {
    console.log('Filters updated:', filters);
    console.log('Ranged Values:', rangedValues);

    // Pass filters and ranged values directly to UniversityByProgramListComponent
    if (this.universityListComponent) {
      this.universityListComponent.applyFilters(filters, rangedValues);
    }
  }
}
