package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuestionSubMain;
import com.shahroz.UniverCity.Quiz.Entities.QuizQuestion;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategoryMainCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.data.domain.Pageable;
import java.util.List;

public interface QuestionSubMainRepository  extends JpaRepository<QuestionSubMain,Long> {



    @Query("SELECT q.quizQuestion FROM QuestionSubMain q WHERE q.quizSubCategoryMainCategory = :quizSubCategoryMainCategory ")
    Page<QuizQuestion> findQuizQuestionByQuizSubCategoryMainCategory(@Param("quizSubCategoryMainCategory") QuizSubCategoryMainCategory quizSubCategoryMainCategory,
                                                                     Pageable pageable);
}
