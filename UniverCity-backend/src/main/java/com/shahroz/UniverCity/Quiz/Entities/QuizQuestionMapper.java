package com.shahroz.UniverCity.Quiz.Entities;


import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityRequest;
import com.shahroz.UniverCity.University.UniversityResponse;
import org.springframework.stereotype.Service;

@Service
public class QuizQuestionMapper {

    public QuizQuestion toQuizQuestion(QuizQuestionRequest request){

        return QuizQuestion.builder()
                .quizquestion_id(request.quizquestion_id())
                .correctAnswer(request.correctAnswer())
                .question(request.question())
                .difficultyLevel(request.difficultyLevel())
                .option1(request.option1())
                .option2(request.option2())
                .option3(request.option3())
                .option4(request.option4())
                .build();
    }


    public QuizQuestionResponse toQuizQuestionResponse(QuizQuestion quizQuestion) {

        return QuizQuestionResponse.builder()
                .quizquestion_id(quizQuestion.getQuizquestion_id())
                .correctAnswer(quizQuestion.getCorrectAnswer())
                .question(quizQuestion.getQuestion())
                .difficultyLevel(quizQuestion.getDifficultyLevel())
                .option1(quizQuestion.getOption1())
                .option2(quizQuestion.getOption2())
                .option3(quizQuestion.getOption3())
                .option4(quizQuestion.getOption4())
                .build();

    }
}
