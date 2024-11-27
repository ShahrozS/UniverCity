package com.shahroz.UniverCity.University;


import com.shahroz.UniverCity.Utility.PageResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("university")
@RequiredArgsConstructor
@Tag(name = "University")
public class UniversityController {

    private final UniversityService service;

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




}
