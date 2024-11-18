package com.shahroz.UniverCity.Entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class University {

    @Id
    private long university_id;

    private String name;
    private String about;
    private int rank;
    private int programCount;
    private Date applyDate;
    private Date startDate;
    private String websiteLink;
    private String accrediatetionBody;
    private long averageFees;

    //relation
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "universitylocation_id", referencedColumnName = "universitylocation_id")
    private UniversityLocation universityLocations;


    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "university_id")
    private List<UniversityContact> universityContacts;


    @OneToMany(mappedBy = "university" , cascade = CascadeType.ALL)
    private List<Facility> facilities;


    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Program> programs;

    @OneToMany(mappedBy = "university" , cascade = CascadeType.ALL)
    @JoinColumn(name = "university_id")
    private List<UniversityReview> reviews;



}
