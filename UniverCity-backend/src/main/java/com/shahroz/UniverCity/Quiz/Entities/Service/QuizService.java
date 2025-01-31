package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.Repositories.QuizCategoryRepository;
import com.shahroz.UniverCity.Repositories.QuizQuestionRepository;
import com.shahroz.UniverCity.Repositories.QuizSubCategoryRepository;
import com.shahroz.UniverCity.Repositories.UserQuizRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class QuizService {

    private final QuizCategoryRepository quizCategory;
    private final QuizSubCategoryRepository quizSubCategoryRepository;
    private final QuizQuestionRepository question;
    private final UserQuizRepository quizRepository;
    private final QuizQuestionMapper quizQuestionMapper;

    public QuizQuestion addQuestion(QuizQuestionRequest quizQuestionRequest){

        QuizQuestion quizQuestion = quizQuestionMapper.toQuizQuestion(quizQuestionRequest);
        return question.save(quizQuestion);
    }

    public QuizQuestionResponse getQuestionById(long id){

        return question.findById(id)
                .map(quizQuestionMapper::toQuizQuestionResponse)
                .orElseThrow(()->new EntityNotFoundException("No Question with such ID"+ id));
    }





}
