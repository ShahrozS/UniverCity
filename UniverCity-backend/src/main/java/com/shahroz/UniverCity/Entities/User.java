package com.shahroz.UniverCity.Entities;


import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
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


    // preferenceID







}
