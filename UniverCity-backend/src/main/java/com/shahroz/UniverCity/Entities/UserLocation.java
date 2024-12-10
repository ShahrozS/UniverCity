package com.shahroz.UniverCity.Entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
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



    private String longitude;
    private String latitude;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city;




    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;




}


