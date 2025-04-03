package com.shahroz.UniverCity.Review;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.Utility.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UniversityReview extends BaseEntity {

    @Id
    @GeneratedValue
    private long universityreview_id;

    private String review;
    private int rating;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="university-id")
    private University university;


    @OneToOne(mappedBy = "universityreview")
    private User user;



}
