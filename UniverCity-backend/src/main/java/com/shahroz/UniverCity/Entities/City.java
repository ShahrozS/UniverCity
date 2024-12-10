package com.shahroz.UniverCity.Entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.University.UniversityLocation;
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
public class City {

    @Id
    @GeneratedValue
    private Long city_id;
    private String name;
    private String province;

    @JsonIgnore
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL, orphanRemoval = true)
    List<UniversityLocation> universityLocations;

    @JsonIgnore
    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL, orphanRemoval = true)
    List<UserLocation> userLocations;


}
