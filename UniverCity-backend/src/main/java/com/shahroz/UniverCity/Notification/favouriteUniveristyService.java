package com.shahroz.UniverCity.Notification;


import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Repositories.UniversityRepository;
import com.shahroz.UniverCity.Repositories.UserRepository;
import com.shahroz.UniverCity.University.University;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
@Slf4j
@Transactional
public class favouriteUniveristyService {

    private final UserRepository userRepository;
    private final UniversityRepository universityRepository;

    boolean isExist(long university_id, Authentication authentication){

        User user = userRepository.findByEmail(authentication.getName()).get();
        University university = universityRepository.findById(university_id).get();

        return user.getFavoriteUniversities().contains(university);
    }

    void addFavouriteUniversity(long university_id, Authentication authentication){
        User user = userRepository.findByEmail(authentication.getName()).get();
        University university = universityRepository.findById(university_id).get();

        user.getFavoriteUniversities().add(university);
        userRepository.save(user);
    }

    void deleteFavouriteUniversity(long university_id, Authentication authentication){
        User user = userRepository.findByEmail(authentication.getName()).get();
        University university = universityRepository.findById(university_id).get();

        user.getFavoriteUniversities().remove(university);
        userRepository.save(user);
    }

    List<University> getFavouriteUniversities(Authentication authentication){
        User user = userRepository.findByEmail(authentication.getName()).get();

        return user.getFavoriteUniversities().stream().toList();
    }

}
