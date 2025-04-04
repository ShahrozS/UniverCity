package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Review.UniversityReview;
import com.shahroz.UniverCity.University.University;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UniversityReviewRepository   extends JpaRepository<UniversityReview, Long> {

    public List<UniversityReview> findUniversityReviewByUniversityId(long universityId);


}
