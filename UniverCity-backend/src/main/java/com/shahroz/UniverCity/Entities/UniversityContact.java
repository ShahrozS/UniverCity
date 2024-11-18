package com.shahroz.UniverCity.Entities;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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

}
