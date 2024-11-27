package com.shahroz.UniverCity.University;

import com.shahroz.UniverCity.Entities.Facility;
import com.shahroz.UniverCity.Entities.Program;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Utility.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@ToString
@AllArgsConstructor
@Setter
@Getter
@SuperBuilder
@NoArgsConstructor
public class University extends BaseEntity {


    @Column(unique = true)
    private String name;
    private String about;
    private int rank;
    private Date applyDate;
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


    @OneToMany(mappedBy = "university" , cascade = CascadeType.ALL)
    private List<Facility> facilities;


    @OneToMany(mappedBy = "university", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Program> programs;

    @OneToMany(mappedBy = "university" , cascade = CascadeType.ALL)
    private List<UniversityReview> reviews;

    @ManyToMany(mappedBy = "favoriteUniversities")
    private Set<User> favoritedByUsers = new HashSet<>();




}
