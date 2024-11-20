package com.shahroz.UniverCity.Entities;


import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.Set;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
@Table(name = "app_user")
public class User {


    @Id
    private long user_id;

    private String firstName;
    private String lastName;
    private String email;
    private String password;

    //relationship
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "userlocation_id", referencedColumnName = "userlocation_id")
    private UserLocation userLocation;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "academicscore_id", referencedColumnName = "academicscore_id")
    private AcademicScore academicScore;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "universityreview_id", referencedColumnName = "universityreview_id")
    private UniversityReview universityreview;


    @OneToMany(mappedBy = "user")
    private List<Notification> notifications;

    @ManyToMany
    @JoinTable(
            name = "user_favorites", // Name of the join table
            joinColumns = @JoinColumn(name = "user_id"), // Foreign key in join table for User
            inverseJoinColumns = @JoinColumn(name = "university_id") // Foreign key in join table for University
    )
    private Set<University> favoriteUniversities;


    // preferenceID







}
