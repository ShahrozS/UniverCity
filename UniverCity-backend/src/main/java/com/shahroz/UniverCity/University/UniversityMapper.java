package com.shahroz.UniverCity.University;


import org.springframework.stereotype.Service;

@Service
public class UniversityMapper {

    public  University toUniversity(UniversityRequest request){

        return University.builder()
                .id(request.id())
                .about(request.about())
                .applyDate(request.applyDate())
                .name(request.name())
                .accrediatetionBody(request.accrediatetionBody())
                .averageFees(request.averageFees())
                .rank(request.rank())
                .startDate(request.startDate())
                .websiteLink(request.websiteLink())
                .build();
    }


    public UniversityResponse toUniversityResponse( University university) {

    return UniversityResponse.builder()
            .university_id(university.getId())
            .about(university.getAbout())
            .name(university.getName())
            .accrediatetionBody(university.getAccrediatetionBody())
            .applyDate(university.getApplyDate())
            .averageFees(university.getAverageFees())
            .rank(university.getRank())
            .websiteLink(university.getWebsiteLink())
            .startDate(university.getStartDate())
            .build();

    }
}
