package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface CityRepository extends JpaRepository<City,Long> {

}
