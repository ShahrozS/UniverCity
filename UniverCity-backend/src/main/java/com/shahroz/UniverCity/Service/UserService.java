package com.shahroz.UniverCity.Service;


import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;


@RequiredArgsConstructor
@Service
@Slf4j
@Transactional
public class UserService {

    private final UserRepository userRepository;
    public Optional<User> findUserByEmail(String email){
        return userRepository.findByEmail(email);
    }
   public Optional<User> addUser(User user){
        return Optional.empty();

    }
    public Optional<User> findUserById(Long id){
        return userRepository.findById(id);

    }


    public Optional<User> deleteUser(User user){
        return Optional.empty();

    }




}
