package com.shahroz.UniverCity.University;


import com.shahroz.UniverCity.Repositories.UniversityRepository;
import com.shahroz.UniverCity.Utility.PageResponse;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
public class UniversityService {


    private final UniversityMapper mapper;
    private final UniversityRepository repository;




    Long createUniversity(UniversityRequest universityRequest){

        University university = mapper.toUniversity(universityRequest);
        return repository.save(university).getId();

    }
    UniversityResponse findById(Long id){

        return repository.findById(id)
                .map(mapper::toUniversityResponse)
                .orElseThrow(()->new EntityNotFoundException("No university with such ID"+ id));
    }


    void deleteUniversityById(Long universityId){

    }
    Optional<University> updateUniversity(University university){
        return Optional.empty();

    }

    List<Optional<University>> findUniversities(){
        return new ArrayList<>();

    }


    public PageResponse<UniversityResponse> findAllUniversities(int page, int size) {

         Pageable pageable = PageRequest.of(page,size, Sort.by("createdDate").descending());
        Page<University> universities = repository.findAll(pageable);
        List<UniversityResponse> universityResponses = universities.stream()
                .map(mapper::toUniversityResponse)
                .toList();

        return new PageResponse<>(
                universityResponses,
                universities.getNumber(),
                universities.getSize(),
                universities.getTotalElements(),
                universities.getTotalPages(),
                universities.isFirst(),
                universities.isLast()
        );



    }
}
