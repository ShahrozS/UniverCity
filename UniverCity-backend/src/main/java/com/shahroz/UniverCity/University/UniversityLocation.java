package com.shahroz.UniverCity.University;

import jakarta.persistence.*;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UniversityLocation {

    @Id
    @GeneratedValue
    private long universitylocation_id;
    private String city;
    private String province;
    private float latitude;
    private float longitude;



    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "university_id", referencedColumnName = "university_id")
    private University university;



}
