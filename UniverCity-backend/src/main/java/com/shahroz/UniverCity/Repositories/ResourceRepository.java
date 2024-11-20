package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Resource;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ResourceRepository  extends JpaRepository<Resource, Long> {
}
