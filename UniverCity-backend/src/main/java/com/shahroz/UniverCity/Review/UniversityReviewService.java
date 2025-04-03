package com.shahroz.UniverCity.Review;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Repositories.UniversityRepository;
import com.shahroz.UniverCity.Repositories.UniversityReviewRepository;
import com.shahroz.UniverCity.Repositories.UserRepository;
import com.shahroz.UniverCity.Review.UniversityReview;
import com.shahroz.UniverCity.University.University;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UniversityReviewService {
    private final UniversityReviewRepository reviewRepository;
    private final UniversityRepository universityRepository;
    private final UserRepository userRepository;

    // Add a new review
    public UniversityReview addReview(Long universityId, Long userId, UniversityReview reviewRequest) {
        University university = universityRepository.findById(universityId)
                .orElseThrow(() -> new RuntimeException("University not found"));
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        UniversityReview review = new UniversityReview();
        review.setUniversity(university);
        review.setUser(user);
        review.setRating(reviewRequest.getRating());
        review.setReview(reviewRequest.getReview());

        return reviewRepository.save(review);
    }

    // Edit an existing review
    public UniversityReview editReview(Long reviewId, UniversityReview updatedReview) {
        UniversityReview existingReview = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("UniversityReview not found"));

        existingReview.setRating(updatedReview.getRating());
        existingReview.setReview(updatedReview.getReview());

        return reviewRepository.save(existingReview);
    }

    // Delete a review
    public void deleteReview(Long reviewId) {
        UniversityReview review = reviewRepository.findById(reviewId)
                .orElseThrow(() -> new RuntimeException("UniversityReview not found"));
        reviewRepository.delete(review);
    }

    // Get all reviews for a university
    public List<UniversityReview> getAllReviews(Long universityId) {
        return reviewRepository.findUniversityReviewByUniversityId(universityId);
    }

    public double getUniversityRating(Long universityId){

        // take all of the ratings of this university
        // average of all the stars.
        // return the stars.

        List<UniversityReview> reviews  = reviewRepository.findUniversityReviewByUniversityId(universityId);

        double rating = reviews.stream().mapToInt(UniversityReview::getRating).average().orElse(0.0);

        return rating;
    }
}
