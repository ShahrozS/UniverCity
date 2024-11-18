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
public class Facility {

    @Id
    private long facility_id;

    private String facilityName;

    @ManyToOne
    @JoinColumn(
            name = "university_id",
            referencedColumnName = "university_id"
    )
    private University university;


}
