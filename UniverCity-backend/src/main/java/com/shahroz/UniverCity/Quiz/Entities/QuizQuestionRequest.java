package com.shahroz.UniverCity.Quiz.Entities;


import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.util.Date;

public record QuizQuestionRequest(





                 long quizquestion_id,
                 @NotNull(message = "100")
                 @NotEmpty(message = "100")
                 String question,
                 String option1,
                 String option2,
                 String option3,
                 String option4,
                 @NotNull(message = "101")
                 @NotEmpty(message = "101")
                String correctAnswer,
                int difficultyLevel


)
{

}
