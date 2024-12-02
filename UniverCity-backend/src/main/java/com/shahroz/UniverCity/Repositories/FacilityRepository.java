package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Facility;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FacilityRepository extends JpaRepository<Facility, Long> {


    List<Facility> getFacilitiesByUniversity_id(Long universityId);

}
