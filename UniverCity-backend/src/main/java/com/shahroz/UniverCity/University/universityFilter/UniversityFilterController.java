package com.shahroz.UniverCity.University.universityFilter;

import com.shahroz.UniverCity.Entities.City;
import com.shahroz.UniverCity.Repositories.CityRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("universityFilter")
@RequiredArgsConstructor
@Tag(name = "UniversityFilter")
public class UniversityFilterController {


    private final CityRepository cityRepository;

    @GetMapping("/getCities")
    ResponseEntity<List<City>> getCities(){
        return ResponseEntity.ok(cityRepository.findAll());
    }




}
