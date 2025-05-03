package com.shahroz.UniverCity.University;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UniversityResponse {
    private static final long serialVersionUID = 1L;

    private long id;


    private String name;
    private String about;
    private int rank;
    private Date applyDate;
    private Date startDate;
    private Date entryTestDate;
    private String websiteLink;
    private String accrediatetionBody;
    private double averageFees;



}
