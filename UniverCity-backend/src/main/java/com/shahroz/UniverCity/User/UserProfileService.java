package com.shahroz.UniverCity.User;


import com.shahroz.UniverCity.DTOs.UserDetailDTO;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Notification.Favourite.FavouriteUniveristyService;
import com.shahroz.UniverCity.Quiz.Entities.Service.QuizService;
import com.shahroz.UniverCity.Quiz.Entities.UserQuiz;
import com.shahroz.UniverCity.Repositories.NotificationRepository;
import com.shahroz.UniverCity.Repositories.UserRepository;
import com.shahroz.UniverCity.University.University;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserProfileService {

    private final UserRepository userRepository;
    private final NotificationRepository notificationRepository;
    private final FavouriteUniveristyService favouriteUniveristyService;
    private final QuizService quizService;

    UserDetailDTO getUserDetails(Authentication authentication){
        User user = userRepository.findByEmail(authentication.getName()).get();

        var UserDetails = UserDetailDTO.builder()
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .phoneNumber(user.getPhoneNumber())
                .Username(user.getUsername())
                .password(user.getPassword())
                .build();

        return UserDetails;
    }

    User updateUserDetails(Authentication authentication, UserDetailDTO userDetailDTO){
        User user = userRepository.findByEmail(authentication.getName()).get();

        user.setUsername(userDetailDTO.getUsername());
        user.setFirstName(userDetailDTO.getFirstName());
        user.setLastName(userDetailDTO.getLastName());
        user.setPhoneNumber(userDetailDTO.getPhoneNumber());
        user.setEmail(userDetailDTO.getEmail());
        user.setPassword(userDetailDTO.getPassword());
        userRepository.save(user);

        return user;
    }


    List<University> getFavouriteUniversities(Authentication authentication){
       return favouriteUniveristyService.getFavouriteUniversities(authentication);
    }

    List<UserQuiz> getAcademicScores(Authentication authentication)
    {
        return quizService.getLastFiveUserQuiz(authentication);
    }







}
