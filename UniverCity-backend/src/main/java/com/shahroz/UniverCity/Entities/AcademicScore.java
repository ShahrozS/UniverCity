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
public class AcademicScore {
    @Id
    @GeneratedValue
    private long academicscore_id;



    private float matricScore;
    private float intermediateScore;



}
