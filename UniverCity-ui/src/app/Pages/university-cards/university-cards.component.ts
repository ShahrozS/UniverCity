import { Component, EventEmitter, Input, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { faHeart } from '@fortawesome/free-solid-svg-icons';
import { FavouriteUniversityControllerService } from '../../Services/services';

@Component({
  selector: 'app-university-cards',
  templateUrl: './university-cards.component.html',
  styleUrl: './university-cards.component.scss'
})
export class UniversityCardsComponent {

  constructor(private router: Router
  , private favouriteUniversityService: FavouriteUniversityControllerService
  ){

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


  favUni(event: Event){
    event.stopPropagation();
    this.favouriteUniversityService.addFavorite({
      universityId : this.university?.university_id
    }
    ).subscribe(
      (result)=>{
        console.log("Saved university " + result);
      },
      (error)=>{
        console.log("Couldnt save university." + error);
      }
    )
  }
}
