package com.shahroz.UniverCity.University;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UniversityResponse {

    private long university_id;


    private String name;
    private String about;
    private int rank;
    private Date applyDate;
    private Date startDate;
    private String websiteLink;
    private String accrediatetionBody;
    private double averageFees;



}
