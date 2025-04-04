package com.shahroz.UniverCity.Review;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.Utility.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity
@ToString
@AllArgsConstructor
@Setter
@Getter
@Builder
@NoArgsConstructor
@EntityListeners(AuditingEntityListener.class)

public class UniversityReview  {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long universityReview_id;

    @CreatedDate
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    @Column(insertable = false)
    private LocalDateTime lastModifiedDate;

    private String review;
    private int rating;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="university_id")
    private University university;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;



}
