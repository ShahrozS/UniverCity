package com.shahroz.UniverCity.Quiz.Entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class QuestionSubMain {

    @Id
    @GeneratedValue
    private long QuestionSubMain_id;


  @ManyToOne
  @JoinColumn(name = "quizquestion_id" )
    private QuizQuestion quizQuestion;

  @ManyToOne
    @JoinColumn(name = "quizsubcategorymaincategory_id")
    private QuizSubCategoryMainCategory quizSubCategoryMainCategory;
}
