package com.shahroz.UniverCity.Entities;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.*;

import java.util.Date;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class Resource {

    @Id
    @GeneratedValue
    private long resource_id;


    private String resourceName;
    private Date updloadedAt;
    private String URL;
    private String universityName;
    private String testName;


}
