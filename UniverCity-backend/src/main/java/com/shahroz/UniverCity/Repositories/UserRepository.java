package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository  extends JpaRepository<User, Long> {
}
