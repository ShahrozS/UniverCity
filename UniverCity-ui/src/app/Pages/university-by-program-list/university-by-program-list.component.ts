
import { Component } from '@angular/core';
import { UniversityCardComponent } from '../university-card/university-card.component';
import { CommonModule } from '@angular/common';
import { UniversityService } from '../../Services/services/university.service';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-university-by-program-list',
  standalone: true,
  imports: [UniversityCardComponent, CommonModule],
  templateUrl: './university-by-program-list.component.html',
  styleUrl: './university-by-program-list.component.scss'
})
export class UniversityByProgramListComponent {
  universities: any[] = [];
  selectedUniversities: any[] = [];
  uniProgram : any;

  filteredUniversities = this.universities;

  constructor(private universityListService: UniversityService, private router: Router, private route: ActivatedRoute) {
    this.route.queryParams.subscribe(params => {
      this.uniProgram = params['program'];
    });

    this.fetchUniversitiesByProgram(this.uniProgram);
  }

  fetchUniversitiesByProgram(name: string): void {
    //change to findUniverSity by Program Name
    /*
      this.universityListService.findAllUniversity().subscribe(
      (data) => {
        this.universities = data;
        console.group(this.universities[1].universityname);
      },
      (error) => {
        console.error('Error fetching universities by program:', error);
      }
    );

    this.filteredUniversities = this.universities;
    */

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
