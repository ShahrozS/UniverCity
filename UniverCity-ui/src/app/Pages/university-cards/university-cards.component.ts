import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { faHeart } from '@fortawesome/free-solid-svg-icons';
import { FavouriteUniversityControllerService } from '../../Services/services';
import { ChangeDetectorRef } from '@angular/core';

@Component({
  selector: 'app-university-cards',
  templateUrl: './university-cards.component.html',
  styleUrl: './university-cards.component.scss'
})
export class UniversityCardsComponent implements OnInit {
  
  @Input() university: any;
  @Output() selectionChanged = new EventEmitter<any>();

  isSelected = false;
  isFavourite = false;
  isProcessing = false; // Prevents multiple clicks
  faHeart = faHeart;

  constructor(
    private router: Router,
    private favouriteUniversityService: FavouriteUniversityControllerService,
    private cdr: ChangeDetectorRef // 🔥 Ensures UI updates immediately
  ) {}

  isFavorite = false;

  ngOnInit() {
    this.checkIfFavourite();

  }

  toggleSelection() {
    this.isSelected = !this.isSelected;
    this.selectionChanged.emit({ university: this.university, isSelected: this.isSelected });
  }

  viewDetails() {
    this.router.navigate(['/university-details'], {
      queryParams: {
        university: JSON.stringify(this.university)
      }
    });
  }

  /** 🔥 Check if the university is already a favorite */
  checkIfFavourite() {
    this.favouriteUniversityService.isFavorite({ universityId: this.university.university_id }).subscribe(
      (isFav) => {
        this.isFavourite = isFav; 
      },
      (error) => console.log("Error checking favorite status:", error)
    );
  }

  /** 🔥 Handles adding the university to favorites */
  favUni(event: Event) {
    event.stopPropagation(); // Prevent event bubbling

    if(this.isFavorite == false){
      
      this.favouriteUniversityService.addFavorite({universityId:this.university.university_id}).subscribe(
        (val)=>{
          console.log(val);
          this.isFavorite = true;
          console.log(this.isFavorite);
        },
        (error)=>{
          this.isFavorite = false;
          console.log("Cant favourite",error)
        }
      )

    }



    // if (this.isFavourite || this.isProcessing) return; // 🔥 Prevents multiple clicks

    // console.log("Adding to favorites...");

    // // 🔥 Step 1: Optimistically update UI & disable button
    // this.isFavourite = true; 
    // this.isProcessing = true;
    // this.cdr.detectChanges(); // 🔥 Immediately updates UI

    // // 🔥 Step 2: Make API request to save favorite
    // this.favouriteUniversityService.addFavorite({ universityId: this.university.university_id }).subscribe(
    //   () => {
    //     console.log("Successfully added to favorites!");
    //     this.cdr.detectChanges(); // 🔥 Force UI refresh
    //   },
    //   (error) => {
    //     console.log("Error adding to favorites:", error);
    //     this.isFavourite = false; // 🔥 Revert on failure
    //     this.isProcessing = false; // Allow retrying
    //     this.cdr.detectChanges(); // 🔥 Ensure UI updates
    //   }
    // );
  }


  toggleFavorite() {
    if (!this.isFavorite) {
      this.favouriteUniversityService.addFavorite(this.university.university_id);
      this.isFavorite = true; // Immediately update UI state
    }
  }
}
