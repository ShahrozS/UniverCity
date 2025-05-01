import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';
import { Router } from '@angular/router';
import { faHeart } from '@fortawesome/free-solid-svg-icons';
import { ChangeDetectorRef } from '@angular/core';
import { FavouritesService } from '../../../Services/services';

@Component({
  selector: 'app-university-cards',
  templateUrl: './university-cards.component.html',
  styleUrl: './university-cards.component.scss'
})
export class UniversityCardsComponent implements OnInit, OnChanges {
  
  @Input() university: any;
  @Output() selectionChanged = new EventEmitter<any>();

  isSelected = false;
  isFavourite = false;
  isProcessing = false;
  faHeart = faHeart;
  isFavorite = false;

  constructor(
    private router: Router,
    private favouriteUniversityService: FavouritesService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit() {
    // console.log(this.university.id);
    // console.log("Catching: " + this.checkIfFavourite());
    // if(this.checkIfFavourite()){
    //   this.isFavorite = true;
    // }
    // console.log(this.university.id + " : " + this.isFavorite);


  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['university']) {
      this.university = changes['university'].currentValue;
  
      if (this.university) {
        console.log("✅ University Received:", this.university);
      } else {
        console.warn("⚠️ University is UNDEFINED after filtering!");
      }
    }
  }
  
  

  toggleSelection() {
    this.isSelected = !this.isSelected;
    this.selectionChanged.emit({ university: this.university, isSelected: this.isSelected });
    console.log(this.university);
  }

  viewDetails() {
    this.router.navigate(['/university-details'], {
      queryParams: { university: JSON.stringify(this.university) }
    });
  }

  /** 🔥 Fix: Properly handle async `checkIfFavourite()` */
  checkIfFavourite() {
    this.favouriteUniversityService.isFavorite({ universityId: this.university.id }).subscribe(
      (isFav) => {
        console.log("Favourite status:", isFav);
        this.isFavorite = isFav;  // 🔥 Fix: Update variable inside subscription
        this.cdr.detectChanges(); // 🔥 Ensure UI updates
      },
      (error) => console.log("Error checking favorite status:", error)
    );
  }

  favUni(event: Event) {
    event.stopPropagation();

    const universityId = this.university.id;
    console.log(this.university);
    console.log(universityId);
    if (!this.isFavorite) {
      this.favouriteUniversityService.addFavorite({ universityId: this.university.id }).subscribe(
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

  toggleFavorite() {
    if (!this.isFavorite) {
      this.favouriteUniversityService.addFavorite({ universityId: this.university.id });
      this.isFavorite = true;
    }
  }
}
