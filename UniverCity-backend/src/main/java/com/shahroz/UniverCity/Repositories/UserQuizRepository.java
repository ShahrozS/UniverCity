package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Quiz.Entities.UserQuiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserQuizRepository  extends JpaRepository<UserQuiz, Long> {
}
