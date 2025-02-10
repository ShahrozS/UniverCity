package com.shahroz.UniverCity.Quiz.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class QuizCategory {


    @Id
    @GeneratedValue
    long quizcategory_id;

    String name;

    @JsonIgnore
    @OneToMany(mappedBy = "quizCategory")
    private List<UserQuiz> userQuizzes = new ArrayList<>();

//    @OneToMany(mappedBy = "quizCategory")
//    private List<QuizSubCategory> quizSubCategories = new ArrayList<>();


    @JsonIgnore
    @OneToMany(mappedBy = "quizCategory")
    private List<QuizSubCategoryMainCategory> quizSubCategoryMainCategories = new ArrayList<>();

}
