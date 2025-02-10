package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuizCategory;
import com.shahroz.UniverCity.Quiz.Entities.QuizQuestion;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategory;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategoryMainCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizSubCategoryMainCategoryRepository extends JpaRepository<QuizSubCategoryMainCategory,Long> {

    List<QuizSubCategory> findQuizSubCategoryByQuizCategory(QuizCategory quizCategory);

    List<QuizQuestion> findQuizQuestionsByQuizCategoryAndQuizSubCategory(QuizCategory quizCategory, QuizSubCategory quizSubCategory);

    QuizSubCategoryMainCategory findQuizSubCategoryMainCategoriesByQuizCategoryAndQuizSubCategory(QuizCategory quizCategory, QuizSubCategory quizSubCategory);

}


