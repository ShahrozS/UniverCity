package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Quiz.Entities.UserQuiz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserQuizRepository  extends JpaRepository<UserQuiz, Long> {

    List<UserQuiz> getUserQuizByUser(User user);
}
