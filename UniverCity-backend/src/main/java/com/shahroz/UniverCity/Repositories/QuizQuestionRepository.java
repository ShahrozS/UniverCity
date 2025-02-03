package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuizQuestion;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategory;
import com.shahroz.UniverCity.University.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizQuestionRepository extends JpaRepository<QuizQuestion, Long> {

    List<QuizQuestion> findQuizQuestionByQuizSubCategory(QuizSubCategory quizSubCategory);

    @Query("SELECT q FROM QuizQuestion q WHERE q.quizSubCategory.quizsubcategory_id = :subcategory_id AND q.quizSubCategory.quizCategory.quizcategory_id = :category_id")
    List<QuizQuestion> findQuizQuestionByQuizSubCategory(@Param("category_id") long category_id, @Param("subcategory_id") long subcategory_id);


    // select * from quizquestions where q.



}
