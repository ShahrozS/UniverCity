import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { faHeart } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-university-cards',
  templateUrl: './university-cards.component.html',
  styleUrl: './university-cards.component.scss'
})
export class UniversityCardsComponent {

  constructor(private router: Router){

  }

@Input() university: any;

@Output() selectionChanged = new EventEmitter<any>();
  isSelected = false;

  faHeart = faHeart;

  toggleSelection() {
  console.log(this.university);


    this.isSelected = !this.isSelected;
    this.selectionChanged.emit({ university: this.university, isSelected: this.isSelected });
  }


  viewDetails(){
    this.router.navigate(['/university-details'], {
      queryParams: {
        university: JSON.stringify(this.university)
      }
    });
  }
}
