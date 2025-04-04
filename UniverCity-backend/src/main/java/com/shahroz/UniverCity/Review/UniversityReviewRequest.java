package com.shahroz.UniverCity.Review;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UniversityReviewRequest {
    private String review;
    private int rating;
    private LocalDateTime lastModifiedDate;
    private LocalDateTime createdDate;

}
