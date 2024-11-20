package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.UserFavourite;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserFavouriteRepository  extends JpaRepository<UserFavourite, Long> {
}
