package com.shahroz.UniverCity.Entities;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
    private long universitycontact_id;


    private String email;
    private String phoneNumber;

    @ManyToOne
    @JoinColumn(name = "university-id")
    private University university;

}
