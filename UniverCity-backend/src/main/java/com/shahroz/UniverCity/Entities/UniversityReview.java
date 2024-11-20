package com.shahroz.UniverCity.Entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Optional;

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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="university-id")
    private University university;


    @OneToOne(mappedBy = "universityreview")
    private User user;



}
