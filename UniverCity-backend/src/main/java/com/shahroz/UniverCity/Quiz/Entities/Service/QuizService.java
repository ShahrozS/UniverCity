package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.Repositories.QuizCategoryRepository;
import com.shahroz.UniverCity.Repositories.QuizQuestionRepository;
import com.shahroz.UniverCity.Repositories.QuizSubCategoryRepository;
import com.shahroz.UniverCity.Repositories.UserQuizRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class QuizService {

    private final QuizCategoryRepository quizCategory;
    private final QuizSubCategoryRepository quizSubCategoryRepository;
    private final QuizQuestionRepository question;
    private final UserQuizRepository quizRepository;
    private final QuizQuestionMapper quizQuestionMapper;

    public Long addQuestion(QuizQuestionRequest quizQuestionRequest){

        QuizQuestion quizQuestion = quizQuestionMapper.toQuizQuestion(quizQuestionRequest);
        return question.save(quizQuestion).getQuizquestion_id();
    }

    public QuizQuestionResponse getQuestionById(long id){

        return question.findById(id)
                .map(quizQuestionMapper::toQuizQuestionResponse)
                .orElseThrow(()->new EntityNotFoundException("No Question with such ID"+ id));
    }


    public List<QuizQuestion> getQuestionsBySubCategory(long quizCategory,long quizSubCategory ){
        return question.findQuizQuestionByQuizSubCategory(quizCategory,quizSubCategory);
    }


    public List<QuizQuestion> shuffleQuiz;

    //categories extraction
    public Optional<QuizCategory> getCategoryById (long id){
        return quizCategory.findById(id);
    }
    public Optional<QuizSubCategory> getSubCategoryByMainCategory(QuizCategory quizCategory){
            return quizSubCategoryRepository.findByQuizCategory(quizCategory);
    }
    public Optional<QuizSubCategory> getSubCategoryById(long id){
        return quizSubCategoryRepository.findById(id);
    }


}
