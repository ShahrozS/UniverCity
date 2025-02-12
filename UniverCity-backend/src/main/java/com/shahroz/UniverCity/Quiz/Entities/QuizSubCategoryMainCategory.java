package com.shahroz.UniverCity.Quiz.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
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
public class QuizSubCategoryMainCategory {


    @Id
    @GeneratedValue
    private long QuizSubCategoryMainCategory_id;


    @ManyToOne
    @JoinColumn(name = "quizcategory_id")
    private QuizCategory quizCategory;

    @ManyToOne
    @JoinColumn(name = "quizsubcategory_id")
    private QuizSubCategory quizSubCategory;


    @JsonIgnore
    @OneToMany(mappedBy = "quizSubCategoryMainCategory", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuestionSubMain> questionSubMains = new ArrayList<>();



}
