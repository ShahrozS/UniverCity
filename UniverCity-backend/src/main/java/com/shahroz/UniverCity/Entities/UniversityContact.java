package com.shahroz.UniverCity.Entities;


import jakarta.persistence.*;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UniversityContact {


    @Id
    @GeneratedValue
    private long universitycontact_id;


    private String email;
    private String phoneNumber;

    @ManyToOne
    @JoinColumn(name = "university-id")
    private University university;

}
