package com.shahroz.UniverCity.Entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.shahroz.UniverCity.University.UniversityLocation;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@ToString(exclude = {"universityLocations","userLocations"})
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class City {

    @Id
    @GeneratedValue
    private Long city_id;
    private String name;
    private String province;

    @JsonIgnore
    @JsonManagedReference
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL, orphanRemoval = true)
    List<UniversityLocation> universityLocations = new ArrayList<>();

    @JsonManagedReference
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL, orphanRemoval = true)
    List<UserLocation> userLocations = new ArrayList<>();


}
