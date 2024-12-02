package com.shahroz.UniverCity.University.universityFilter;


import com.shahroz.UniverCity.University.University;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class UniversityFilterService {


    private final UniversityFilterRepository repository;



    public List<University> getUniversitiesByFilters(UniversityFilter filter) {
        return repository.findUniversitysByFilters(filter);
    }


}
