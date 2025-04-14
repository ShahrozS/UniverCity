package com.shahroz.UniverCity.DTOs;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.Entities.AcademicScore;
import com.shahroz.UniverCity.Entities.Notification;
import com.shahroz.UniverCity.Entities.Role;
import com.shahroz.UniverCity.Entities.UserLocation;
import com.shahroz.UniverCity.Review.UniversityReview;
import com.shahroz.UniverCity.University.University;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
public class UserDetailDTO {



    private String password;
    private String Username;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String email;

}
