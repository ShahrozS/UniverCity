package com.shahroz.UniverCity.Service;


import com.shahroz.UniverCity.Entities.Quiz;
import com.shahroz.UniverCity.Entities.QuizQuestion;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class QuizQuestionService {


    Optional<QuizQuestion> createQuizQuestion(QuizQuestion question){
        return Optional.empty();

    }

    Optional<QuizQuestion> findQuizQuestionById(Long id){
        return Optional.empty();

    }

    void deleteQuizQuestion(Long id ){

    }

    Optional<QuizQuestion> updateQuizQuestion(Long id){
        return Optional.empty();

    }

    List<Optional<QuizQuestion>> findBySubject(String Subject){
        return new ArrayList<>();

    }
    List<Optional<QuizQuestion>> findByUniversity(String University){
        return new ArrayList<>();

    }




}
