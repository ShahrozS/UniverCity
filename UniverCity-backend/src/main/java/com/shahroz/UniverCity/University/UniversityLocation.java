package com.shahroz.UniverCity.University;

import com.shahroz.UniverCity.Entities.City;
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
public class UniversityLocation {

    @Id
    @GeneratedValue
    private long universitylocation_id;



    private float latitude;
    private float longitude;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;



    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;


}
