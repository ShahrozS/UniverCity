package com.shahroz.UniverCity.Quiz.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.University.University;
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
@Table(name="quiz_question")
public class QuizQuestion {

    @Id
    @GeneratedValue
    private long quizquestion_id;

    private String question;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String correctAnswer;
    private int difficultyLevel;


    @OneToMany(mappedBy = "quizQuestion", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuestionSubMain> questionSubMains = new ArrayList<>();







}
