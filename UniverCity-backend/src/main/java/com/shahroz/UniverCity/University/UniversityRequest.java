package com.shahroz.UniverCity.University;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

import java.util.Date;


public record UniversityRequest (




     Long id,
     @NotNull(message = "100")
     @NotEmpty(message = "100")
     String name,
     @NotNull(message = "101")
     @NotEmpty(message = "101")
     String about,
     @NotNull(message = "102")
     @NotEmpty(message = "102")
     int rank,
     Date entryTestDate,
     Date applyDate,
     Date startDate,
     @NotNull(message = "103")
     @NotEmpty(message = "103")
     String websiteLink,
     @NotNull(message = "104")
     @NotEmpty(message = "104")
     String accrediatetionBody,
     double averageFees

)
{

}
