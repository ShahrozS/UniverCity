package com.shahroz.UniverCity.Entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UserLocation {

    @Id
    private long userlocation_id;


    private String city;
    private String province;
    private String longitude;
    private String latitude;
}

