import { Component, OnInit, Input } from '@angular/core';
import { UniversityReview, User } from '../../Services/models';
import { AuthenticationService, UniversityReviewControllerService } from '../../Services/services';

@Component({
  selector: 'app-reviews',
  templateUrl: './reviews.component.html',
  styleUrls: ['./reviews.component.scss']
})
export class ReviewsComponent implements OnInit {
  @Input()
  universityId!: number;
  
  reviews: UniversityReview[] = [];
  averageRating: number = 0;
  totalReviews: number = 0;
  currentPage: number = 1;
  
  user: User = {};
  
  // User review data
  userHasReviewed: boolean = false;
  userRating: number = 0;
  reviewText: string = '';
  editText: string = this.reviewText;

  editing:boolean = false;
  






  constructor(
    private reviewService: UniversityReviewControllerService,
    private authService: AuthenticationService
  ) { }

  ngOnInit(): void {
    this.loadUser();
    this.loadReviews();
    this.getAvgRating();



  }
  loadUser():void{
    this.authService.getCurrentUser().subscribe(
      data=>{
        console.log("Logged in user:" + data);
        this.user = data;
      }
    )
  }
  loadReviews(): void {
    this.reviewService.getAllReviews({universityId: this.universityId}).subscribe(
      data => {
        this.reviews = data.map(review => ({
          ...review,
          isUserReview: this.user.user_id === review.user,
          editing: false,
          editText: review.review
        }));
        
        // Check if user has already reviewed
        this.userHasReviewed = this.reviews.some(
          review => review.user === this.user.user_id
        );
        
        // Calculate average rating
       console.log("avg");
       this.totalReviews = this.reviews.length;
       this.getAvgRating();
      },
      error => {
        console.error('Error loading reviews:', error);
      }
    );
  }

  getAvgRating(){
    this.reviewService.getUniversityRating({universityId:this.universityId}).subscribe(
      data=>{
        this.averageRating = data;
      },
      error=>{
        console.log("Couldnt fetch average.",error);
      }
    )
  }
  
  setUserRating(rating: number): void {
    this.userRating = rating;
  }
  
  submitReview(): void {
    if (!this.reviewText || this.userRating === 0) return;
    

    if (this.user?.user_id !== undefined) {
    const UniversityReview = {
        createdDate: new Date().toISOString(),
        lastModifiedDate: new Date().toISOString(),
        rating: this.userRating,
        review: this.reviewText,
      
    }

    const reviewData = {
      universityId: this.universityId,
       userId: this.user.user_id ,
      body: UniversityReview
    };
    
    this.reviewService.addReview(reviewData).subscribe(
      response => {
        // Reset form
        this.reviewText = '';
        this.userRating = 0;
        this.userHasReviewed = true;
        
        // Reload reviews to reflect changes
        this.loadReviews();
      },
      error => {
        console.error('Error submitting review:', error);
      }
    );
    }

  }
  
  startEditingReview(review: UniversityReview): void {
    this.editing = true;
    this.editText = review.review!;
  }
  
  cancelEditingReview(review: UniversityReview): void {
    this.editing = false;
  }
  
  saveEditedReview(review: UniversityReview, editText: string): void {

    console.log(review)
   const editedReview = {
    createdDate: review.createdDate,
    lastModifiedDate:new Date().toISOString(),
    rating: review.rating,
    review: editText,
    }

    const updatedReview = {
      reviewId: review.universityReview_id! ,
      body: editedReview
    };
    
    this.reviewService.editReview(updatedReview).subscribe(
      response => {
        review.review = response.review;
        this.editing = false;
        this.loadReviews();
      },
      error => {
        console.error('Error updating review:', error);
      }
    );
  }
  
  deleteReview(reviewId: number): void {
    if (confirm('Are you sure you want to delete your review?')) {
      this.reviewService.deleteReview({reviewId}).subscribe(
        response => {
          this.userHasReviewed = false;
          console.log("Deleted? " + response);
          this.loadReviews();
        },
        error => {
          console.error('Error deleting review:', error);
        }
      );
    }
  }
}