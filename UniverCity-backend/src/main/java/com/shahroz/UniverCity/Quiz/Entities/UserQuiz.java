package com.shahroz.UniverCity.Quiz.Entities;

import com.shahroz.UniverCity.Entities.User;
import jakarta.persistence.*;
import lombok.*;
import net.minidev.json.annotate.JsonIgnore;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private LocalDate date;
    private String score;
    private float completed;
    private String time;


    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="quizcategory_id")
    private QuizCategory quizCategory;


    @JsonIgnore
    @ManyToOne
    @JoinColumn(
            name = "user_id",
            referencedColumnName = "user_id"
    )
    private User user;




}
