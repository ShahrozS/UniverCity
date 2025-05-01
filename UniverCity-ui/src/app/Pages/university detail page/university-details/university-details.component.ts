import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {faHeart} from '@fortawesome/free-solid-svg-icons';
import { FavouritesService, UniversityService } from '../../../Services/services';
import { University, UniversityResponse } from '../../../Services/models';

@Component({
  selector: 'app-university-details',
  templateUrl: './university-details.component.html',
  styleUrl: './university-details.component.scss'
})
export class UniversityDetailsComponent implements OnInit {
  university!: UniversityResponse;

  faHeart = faHeart;
  isFavourite = false;
  isFavorite = false;



  constructor(private route: ActivatedRoute,
            private favouriteUniversityService: FavouritesService,
            private cdr: ChangeDetectorRef,
            private universityService: UniversityService,
            
        
  ){
  
  }
  
  ngOnInit(): void {

    this.route.queryParams.subscribe(params => {
      this.university = JSON.parse(params['university']);
      
      this.universityService.findUniversityById({ "university-id": this.university.id! })
      .subscribe(data => {
        console.log("------>",data);
        this.university = data;
      });
    
    console.log("university in dets: " , this.university);
    
    })
  }

  toggleFavorite() {
    if (!this.isFavorite) {
      this.favouriteUniversityService.addFavorite({ universityId: this.university.id! });
      this.isFavorite = true;
    }
  }

  favUni(event: Event) {
    event.stopPropagation();

    const universityId = this.university.id;
    console.log(this.university);
    console.log(universityId);
    if (!this.isFavorite) {
      this.favouriteUniversityService.addFavorite({ universityId: this.university.id! }).subscribe(
        () => {
          console.log("Added to favorites!");
          this.isFavorite = true;
          this.cdr.detectChanges(); // 🔥 Ensure UI updates immediately
        },
        (error) => {
          console.error("Error favoriting:", error);
        }
      );
    }
  }


}
