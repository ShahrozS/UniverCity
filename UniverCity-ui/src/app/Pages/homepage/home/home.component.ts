import { FiltersComponent } from '../../filters/filters.component';
import { Component, ViewChild } from '@angular/core';
import { UniversityListComponent } from '../university-list/university-list.component';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent {
  searchText: string = '';
  clearFilters: boolean = false;
  @ViewChild(UniversityListComponent) universityListComponent!: UniversityListComponent;
  @ViewChild(FiltersComponent) filterComponent!: FiltersComponent;
  private delayClearFilter: any;

  onFiltersChanged({ filters, rangedValues }: { filters: any, rangedValues: number[] }): void {
    console.log('Filters updated:', filters);
    console.log('Ranged Values:', rangedValues);
    if(!this.checkFilter(filters,rangedValues)){
      const searchElement = document.getElementById('default-search') as HTMLInputElement;
      if (searchElement) {
        searchElement.value = ''; // Clear the value directly
      }
    }
    
    // Pass filters and ranged values directly to UniversityByProgramListComponent
    if (this.universityListComponent) {
      
      
      this.universityListComponent.applyFilters(filters, rangedValues);
    }

    
    
  }


  checkFilter(filters : any, rangedValues : number[]) : boolean{
    console.log(filters.program);
      console.log(filters.accreditationBody);
      console.log(filters.location.length);
    if(filters.program.length != 0 || filters.accreditationBody.length != 0 || filters.location.length != 0
      || (rangedValues[0] != 20000 && rangedValues[1] != 300000)
    ){
      return true;
    }  

    return false;
  }

  searchUni(val : string){
    if(val.length != 0){
      this.filterComponent.clearFilter();
      if (this.delayClearFilter) {
        clearTimeout(this.delayClearFilter);
      }

     
      
      this.delayClearFilter = setTimeout(() => {
        this.universityListComponent.searchUniversities(val);
      }, 1000);
    
      
      
      
    }
  }
}
