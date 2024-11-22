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
public class Facility {

    @Id
    @GeneratedValue

    private long facility_id;

    private String facilityName;

    @ManyToOne
    @JoinColumn(
            name = "university_id",
            referencedColumnName = "university_id"
    )
    private University university;


}
