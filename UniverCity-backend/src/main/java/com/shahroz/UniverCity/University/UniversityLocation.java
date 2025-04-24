package com.shahroz.UniverCity.University;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
//fixing commit
    @Id
    @GeneratedValue
    private long universitylocation_id;



    private float latitude;
    private float longitude;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;



    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;


}
