package com.shahroz.UniverCity.University.universityFilter;

import com.shahroz.UniverCity.Entities.City;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityLocation;
import com.shahroz.UniverCity.Entities.Program;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UniversityFilterRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<University> findUniversitiesByFilters(UniversityFilter filter) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<University> query = cb.createQuery(University.class);
        Root<University> root = query.from(University.class);

        // Joins for related tables
        Join<University, UniversityLocation> locationJoin = root.join("universityLocations", JoinType.LEFT);
        Join<UniversityLocation, City> cityJoin = locationJoin.join("city", JoinType.LEFT);
        Join<University, Program> programJoin = root.join("programs", JoinType.LEFT);

        // Predicate list to store filter conditions
        List<Predicate> predicates = new ArrayList<>();

        // Filter by location (city name)
        if (filter.getCities() != null && !filter.getCities().isEmpty()) {
            predicates.add(cityJoin.get("name").in(filter.getCities()));
        }

        // Filter by accreditation body
        if (filter.getAccreditationBodies() != null && !filter.getAccreditationBodies().isEmpty()) {
            predicates.add(root.get("accrediatetionBody").in(filter.getAccreditationBodies()));
        }

        // Filter by average fees
        if (filter.getMinFees() != null) {
            predicates.add(cb.greaterThanOrEqualTo(root.get("averageFees"), filter.getMinFees()));
        }
        if (filter.getMaxFees() != null) {
            predicates.add(cb.lessThanOrEqualTo(root.get("averageFees"), filter.getMaxFees()));
        }

        // Filter by program names
        if (filter.getProgram() != null && !filter.getProgram().isEmpty()) {
            System.out.println("In programs + " + filter.getProgram().toString());
            predicates.add(programJoin.get("name").in(filter.getProgram()));
        }

        // Apply predicates to query
        query.where(cb.and(predicates.toArray(new Predicate[0])));

        // Return the filtered list of universities
        return entityManager.createQuery(query).getResultList();
    }
}
