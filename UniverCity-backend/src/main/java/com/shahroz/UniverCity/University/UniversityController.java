package com.shahroz.UniverCity.University;


import com.shahroz.UniverCity.Entities.Facility;
import com.shahroz.UniverCity.University.universityFilter.UniversityFilter;
import com.shahroz.UniverCity.University.universityFilter.UniversityFilterService;
import com.shahroz.UniverCity.Utility.PageResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("university")
@RequiredArgsConstructor
@Tag(name = "University")
public class UniversityController {

    private final UniversityService service;
    private final UniversityFilterService filterService;
    private final UniversityFilter filter;
    @PostMapping
    public ResponseEntity<Long> saveUniversity(
            @Valid @RequestBody UniversityRequest universityRequest
    ){

        return ResponseEntity.ok(service.createUniversity(universityRequest));

    }

    @GetMapping("/{university-id}")
    public ResponseEntity<UniversityResponse> findUniversityById(
            @PathVariable("university-id") Long id
    ){
        return ResponseEntity.ok(service.findById(id));
    }


    @GetMapping
    public ResponseEntity<PageResponse<UniversityResponse>> findAllUniversity(
            @RequestParam(name = "page", defaultValue = "0", required = false) int page,
            @RequestParam(name = "size", defaultValue = "10", required = false) int size
            )
    {
        return ResponseEntity.ok(service.findAllUniversities(page, size));
    }



    // todo: Change the return type and pagination
    @GetMapping("filter")
    public ResponseEntity<List<University>> filterInstitutions(UniversityFilter filter) {
        return ResponseEntity.ok(filterService.getUniversitiesByFilters(filter));
    }


    @GetMapping("/search/{keyword}")
    public ResponseEntity<List<University>> searchUniversities(@PathVariable("keyword") String keyword){
        return ResponseEntity.ok(service.searchUniversityByKeyword(keyword));
    }

    @GetMapping("/getFacilities/{university-id}")
    public ResponseEntity<List<Facility>> getFacilitiesByUniversity(@PathVariable("university-id") Long id){
        return ResponseEntity.ok(service.getFacilitiesByUniversity(id));
    }

    @GetMapping("/getUniversityLocation/{university-id}")
    public ResponseEntity<UniversityLocation> getUniversityLocation(@PathVariable("university-id") Long id){
        return ResponseEntity.ok(service.getUniversityLocation(id));
    }

}
