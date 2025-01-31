package com.shahroz.UniverCity.Quiz.Entities;


import com.shahroz.UniverCity.Entities.Program;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class QuizSubCategory {

    @Id
    @GeneratedValue
    private long quizsubcategory_id;

    private String name;

    @ManyToOne
    @JoinColumn(name = "quizcategory_id")
    private QuizCategory quizCategory;


    @OneToMany(mappedBy = "quizSubCategory", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuizQuestion> quizQuestions;
}
