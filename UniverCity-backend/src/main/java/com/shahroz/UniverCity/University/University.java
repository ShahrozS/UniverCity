package com.shahroz.UniverCity.University;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.Entities.Facility;
import com.shahroz.UniverCity.Entities.Notification;
import com.shahroz.UniverCity.Entities.Program;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Review.UniversityReview;
import com.shahroz.UniverCity.Utility.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.*;

@Entity
@ToString(exclude = {"favoritedByUsers", "notifications"})
@AllArgsConstructor
@Setter
@Getter
@SuperBuilder
@NoArgsConstructor
public class University extends BaseEntity {


    @Column(unique = true)
    private String name;
    @Column(length = 5000)
    private String about;
    private int rank;
    private Date applyDate;
    private Date entryTestDate;
    private Date startDate;
    private String websiteLink;
    private String accrediatetionBody;
    private double averageFees;

    @Transient
    public int getProgramCount(){
        if(programs == null || programs.isEmpty()){
            return 0;
        }
        int count = (int) this.programs.stream().count();

        return count;

    }




    //relation


    @OneToMany(cascade = CascadeType.ALL)
    private List<UniversityContact> universityContacts;



    @JsonIgnore
    @OneToMany(mappedBy = "university", fetch = FetchType.EAGER)
    private List<Notification> notifications = new ArrayList<>();;



    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Program> programs = new ArrayList<>();;

    @JsonIgnore
    @OneToMany(mappedBy = "university" , cascade = CascadeType.ALL)
    private List<UniversityReview> reviews = new ArrayList<>();

    @JsonIgnore
    @ManyToMany(mappedBy = "favoriteUniversities")
    private Set<User> favoritedByUsers = new HashSet<>();

    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Facility> facilities = new ArrayList<>();;



    @JsonIgnore
    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL)
    private List<UniversityLocation> universityLocations = new ArrayList<>();;



}
