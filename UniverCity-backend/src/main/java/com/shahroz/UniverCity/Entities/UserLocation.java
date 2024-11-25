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
public class UserLocation {

    @Id
    @GeneratedValue
    private long userlocation_id;


    private String city;
    private String province;
    private String longitude;
    private String latitude;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

}


