package com.shahroz.UniverCity.Quiz.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
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


    @JsonIgnore
  @ManyToOne
  @JoinColumn(name = "quizquestion_id" )
    private QuizQuestion quizQuestion;

  @ManyToOne
    @JoinColumn(name = "quizsubcategorymaincategory_id")
    private QuizSubCategoryMainCategory quizSubCategoryMainCategory;
}
