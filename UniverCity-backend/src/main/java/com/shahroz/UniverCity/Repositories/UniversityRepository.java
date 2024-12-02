package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.University.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UniversityRepository   extends JpaRepository<University, Long> {




    @Query("SELECT u FROM University u WHERE " +
            "LOWER(u.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(u.about) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(u.accrediatetionBody) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<University> searchUniversities(@Param("keyword") String keyword);


}
