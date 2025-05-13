import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { faHeart } from '@fortawesome/free-solid-svg-icons';
import { FavouritesService, UniversityService } from '../../../Services/services';
import { Program, University, UniversityLocation, UniversityResponse } from '../../../Services/models';


@Component({
  selector: 'app-university-details',
  templateUrl: './university-details.component.html',
  styleUrl: './university-details.component.scss'
})
export class UniversityDetailsComponent implements OnInit {
  university!: UniversityResponse;
  universityLocation!: UniversityLocation;
  faHeart = faHeart;
  isFavourite = false;
  isFavorite = false;
  programs: Program[] = []; // Array to store university programs
  isLoadingPrograms = true; // Flag to track loading state

  constructor(
    private route: ActivatedRoute,
    private favouriteUniversityService: FavouritesService,
    private cdr: ChangeDetectorRef,
    private universityService: UniversityService,
  ) {}
  
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.university = JSON.parse(params['university']);
      
      // Fetch university location
      this.universityService.getUniversityLocation({ "university-id": this.university.id! })
        .subscribe(data => {
          console.log("------>", data);
          this.universityLocation = data;
        });
      
      // Fetch university programs
      this.loadUniversityPrograms();
      
      console.log("university in dets: ", this.university);
    });
  }

  // Method to load programs for the university
  loadUniversityPrograms(): void {
    this.isLoadingPrograms = true;
    
    this.universityService.getProgramsByUniversity({ "university-id": this.university.id! })
      .subscribe(
        (data) => {
          this.programs = data;
          this.isLoadingPrograms = false;
          this.cdr.detectChanges();
          console.log("Loaded programs:", this.programs);
        },
        (error) => {
          console.error("Error loading programs:", error);
          this.isLoadingPrograms = false;
          this.cdr.detectChanges();
        }
      );
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
          this.cdr.detectChanges(); // Ensure UI updates immediately
        },
        (error) => {
          console.error("Error favoriting:", error);
        }
      );
    }
  }
}