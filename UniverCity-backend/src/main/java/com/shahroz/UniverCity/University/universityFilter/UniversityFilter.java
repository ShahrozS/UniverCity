package com.shahroz.UniverCity.University.universityFilter;

import com.shahroz.UniverCity.Entities.Program;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;

@Component
@Getter
@Setter
@ToString
public class UniversityFilter {
    private List<String> cities;
    private Double minFees;
    private Double maxFees;
    private List<String> accreditationBodies;
    private List<String> sectors;
    private LocalDate startDate;
    private LocalDate endDate;
    private List<String> program;
    // Getters and setters
}