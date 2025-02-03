package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuizCategory;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


public interface QuizSubCategoryRepository extends JpaRepository<QuizSubCategory, Long> {

    Optional<QuizSubCategory> findByQuizCategory(QuizCategory quizCategory);
}
