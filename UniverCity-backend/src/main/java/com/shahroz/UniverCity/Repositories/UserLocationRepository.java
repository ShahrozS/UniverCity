package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.UserLocation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserLocationRepository  extends JpaRepository<UserLocation, Long> {
}
