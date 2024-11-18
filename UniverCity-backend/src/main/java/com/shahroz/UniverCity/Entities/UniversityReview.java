package com.shahroz.UniverCity.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UniversityReview {

    @Id
    private long universityreview_id;

    private String review;
    private int rating;

    @OneToOne(mappedBy = "universityreview")
    private User user;



}
