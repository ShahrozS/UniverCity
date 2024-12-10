package com.shahroz.UniverCity.University.universityFilter;


import com.shahroz.UniverCity.DTOs.CityDTO;
import com.shahroz.UniverCity.Entities.City;
import com.shahroz.UniverCity.Repositories.CityRepository;
import com.shahroz.UniverCity.University.University;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class UniversityFilterService {


    private final UniversityFilterRepository repository;
    private final CityRepository cityRepository;

    public List<University> getUniversitiesByFilters(UniversityFilter filter) {
        return repository.findUniversitiesByFilters(filter);
    }


    public List<CityDTO> findCities() {

        List<CityDTO> cityDTOS = new ArrayList<CityDTO>();


        List<City> cityList = cityRepository.findAll();

        for(City city:cityList){
            CityDTO cityDTO = new CityDTO();
            cityDTO.setName(city.getName());
            cityDTO.setProvince(city.getProvince());

            cityDTOS.add(cityDTO );
        }

        return cityDTOS;

    }
}
