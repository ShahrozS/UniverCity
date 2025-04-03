package com.shahroz.UniverCity.Review;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
public class UniversityReviewController {
    private final UniversityReviewService reviewService;

    // Add a review
    @PostMapping("addReview/{universityId}/user/{userId}")
    public ResponseEntity<UniversityReview> addReview(
            @PathVariable Long universityId,
            @PathVariable Long userId,
            @RequestBody UniversityReview review) {
        return ResponseEntity.ok(reviewService.addReview(universityId, userId, review));
    }

    // Edit a review
    @PutMapping("editReview/{reviewId}")
    public ResponseEntity<UniversityReview> editReview(
            @PathVariable Long reviewId,
            @RequestBody UniversityReview updatedReview) {
        return ResponseEntity.ok(reviewService.editReview(reviewId, updatedReview));
    }

    // Delete a review
    @DeleteMapping("deleteReview/{reviewId}")
    public ResponseEntity<String> deleteReview(@PathVariable Long reviewId) {
        reviewService.deleteReview(reviewId);
        return ResponseEntity.ok("UniversityReview deleted successfully");
        //commit
    }

    // Get all reviews for a university
    @GetMapping("allReviews/{universityId}")
    public ResponseEntity<List<UniversityReview>> getAllReviews(@PathVariable Long universityId) {
        return ResponseEntity.ok(reviewService.getAllReviews(universityId));
    }

    @GetMapping("getRating/{universityId}")
    public ResponseEntity<Double> getUniversityRating(@PathVariable Long universityId){
        return ResponseEntity.ok(reviewService.getUniversityRating(universityId));
    }
}

