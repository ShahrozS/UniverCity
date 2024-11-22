package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Token;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Integer> {

    Optional<Token> findByToken(String token);
}

