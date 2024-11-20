package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizRepository extends JpaRepository<Quiz, Long> {
}
