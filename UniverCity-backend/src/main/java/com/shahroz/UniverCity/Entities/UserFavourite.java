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
public class UserFavourite {

    @Id
    @GeneratedValue
    private long userfavourite_id;


}
