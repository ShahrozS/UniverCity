package com.shahroz.UniverCity.Entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class UserQuiz {

    @Id
    @GeneratedValue
    private long userquiz_id;
    private Date date;
    private String score;


    @ManyToOne
    @JoinColumn(
            name = "user_id",
            referencedColumnName = "user_id"
    )
    private User user;




}
