package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuizCategory;
import com.shahroz.UniverCity.Quiz.Entities.QuizQuestion;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategory;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategoryMainCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizSubCategoryMainCategoryRepository extends JpaRepository<QuizSubCategoryMainCategory,Long> {

    @Query("Select q.quizSubCategory from QuizSubCategoryMainCategory q where q.quizCategory = :quizCategory ")
    List<QuizSubCategory> findQuizSubCategoryByQuizCategory(@Param("quizCategory") QuizCategory quizCategory);

    List<QuizQuestion> findQuizQuestionsByQuizCategoryAndQuizSubCategory(QuizCategory quizCategory, QuizSubCategory quizSubCategory);

    QuizSubCategoryMainCategory findQuizSubCategoryMainCategoriesByQuizCategoryAndQuizSubCategory(QuizCategory quizCategory, QuizSubCategory quizSubCategory);

}


