package com.shahroz.UniverCity.Quiz.Entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.Entities.Program;
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
public class QuizSubCategory {

    @Id
    @GeneratedValue
    private long quizsubcategory_id;

    private String name;


    @JsonIgnore
    @OneToMany(mappedBy = "quizSubCategory", cascade = CascadeType.ALL, orphanRemoval = true )
    private List<QuizSubCategoryMainCategory> quizSubCategoryMainCategories =  new ArrayList<>();




}
