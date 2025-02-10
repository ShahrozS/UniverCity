package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.QuizQuestion;
import com.shahroz.UniverCity.Quiz.Entities.QuizSubCategory;
import com.shahroz.UniverCity.University.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizQuestionRepository extends JpaRepository<QuizQuestion, Long> {


}
