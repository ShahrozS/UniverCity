package com.shahroz.UniverCity;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import com.shahroz.UniverCity.Entities.Facility;
import com.shahroz.UniverCity.Repositories.FacilityRepository;
import com.shahroz.UniverCity.Repositories.UniversityRepository;
import com.shahroz.UniverCity.University.*;
import com.shahroz.UniverCity.Utility.PageResponse;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import javax.naming.ldap.PagedResultsResponseControl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

class UniversityServiceTest {

    @Mock
    private UniversityMapper mapper;

    @Mock
    private UniversityRepository repository;

    @Mock
    private  FacilityRepository facilityRepository;

    @InjectMocks
    private UniversityService service;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCreateUniversity() {
        UniversityRequest request = new UniversityRequest(1l,"University","About",2,new Date(),new Date(),"Link","Body",5212.2);
        University university = new University();
        university.setId(1L);

        when(mapper.toUniversity(request)).thenReturn(university);
        when(repository.save(university)).thenReturn(university);

        Long result = service.createUniversity(request);

        assertEquals(1L, result);
        verify(repository, times(1)).save(university);
    }

    @Test
    void testFindById_WhenUniversityExists() {
        University university = new University();
        university.setId(1L);
        UniversityResponse response = new UniversityResponse();

        when(repository.findById(1L)).thenReturn(Optional.of(university));
        when(mapper.toUniversityResponse(university)).thenReturn(response);

        UniversityResponse result = service.findById(1L);

        assertNotNull(result);
        verify(repository, times(1)).findById(1L);
        verify(mapper, times(1)).toUniversityResponse(university);
    }

    @Test
    void testFindById_WhenUniversityDoesNotExist() {
        when(repository.findById(1L)).thenReturn(Optional.empty());

        assertThrows(EntityNotFoundException.class, () -> service.findById(1L));
        verify(repository, times(1)).findById(1L);
    }

    @Test
    void testFindAllUniversities() {
        List<University> universities = List.of(new University(), new University());
        Page<University> page = new PageImpl<>(universities);
        UniversityResponse response = new UniversityResponse();

        when(repository.findAll(PageRequest.of(0, 2, Sort.by("createdDate").descending()))).thenReturn(page);
        when(mapper.toUniversityResponse(any(University.class))).thenReturn(response);

        PageResponse<UniversityResponse> result = service.findAllUniversities(0, 2);

        assertNotNull(result);
        assertEquals(2, result.getContent().size());
        verify(repository, times(1)).findAll(any(PageRequest.class));
    }

    @Test
    void testSearchUniversityByKeyword() {
        List<University> universities = List.of(new University(), new University());

        when(repository.searchUniversities("keyword")).thenReturn(universities);

        List<University> result = service.searchUniversityByKeyword("keyword");

        assertEquals(2, result.size());
        verify(repository, times(1)).searchUniversities("keyword");
    }

    @Test
    void testGetFacilitiesByUniversity() {
        List<Facility> facilities = List.of(new Facility(), new Facility());

        when(facilityRepository.getFacilitiesByUniversity_id(1L)).thenReturn(facilities);

        List<Facility> result = service.getFacilitiesByUniversity(1L);

        assertEquals(2, result.size());
        verify(facilityRepository, times(1)).getFacilitiesByUniversity_id(1L);
    }
}
