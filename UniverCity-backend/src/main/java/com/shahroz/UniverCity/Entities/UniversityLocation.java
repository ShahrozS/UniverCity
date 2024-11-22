package com.shahroz.UniverCity.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
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


}
