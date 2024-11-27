package com.shahroz.UniverCity.University;

import com.shahroz.UniverCity.Entities.User;
import jakarta.persistence.*;
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
