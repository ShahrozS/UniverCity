package com.shahroz.UniverCity.University.universityFilter;
import com.shahroz.UniverCity.Entities.City;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityLocation;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.*;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UniversityFilterRepository  {
    

    @PersistenceContext
    private EntityManager entityManager;

    public List<University> findUniversitysByFilters(UniversityFilter filter) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<University> query = cb.createQuery(University.class);
        Root<University> root = query.from(University.class);


        Join<University, UniversityLocation> locationJoin = root.join("locations", JoinType.LEFT);
        Join<UniversityLocation, City> cityJoin = locationJoin.join("city", JoinType.LEFT);



        List<Predicate> predicates = new ArrayList<>();

        if (filter.getCities() != null && !filter.getCities().isEmpty()) {
            predicates.add(cb.equal(cityJoin.get("name"), filter.getCities()));
        }
        if (filter.getAccreditationBodies() != null && !filter.getAccreditationBodies().isEmpty()) {
            predicates.add(root.get("accreditationBody").in(filter.getAccreditationBodies()));
        }
        if (filter.getSectors() != null && !filter.getSectors().isEmpty()) {
            predicates.add(root.get("sector").in(filter.getSectors()));
        }
        if (filter.getMinFees() != null) {
            predicates.add(cb.greaterThanOrEqualTo(root.get("tuitionFees"), filter.getMinFees()));
        }
        if (filter.getMaxFees() != null) {
            predicates.add(cb.lessThanOrEqualTo(root.get("tuitionFees"), filter.getMaxFees()));
        }

        if (filter.getStartDate() != null) {
            predicates.add(cb.greaterThanOrEqualTo(root.get("date"), filter.getStartDate()));
        }
        if (filter.getEndDate() != null) {
            predicates.add(cb.lessThanOrEqualTo(root.get("date"), filter.getEndDate()));
        }

        query.where(cb.and(predicates.toArray(new Predicate[0])));
        return entityManager.createQuery(query).getResultList();
    }
}
