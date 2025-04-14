package com.shahroz.UniverCity.User;


import com.shahroz.UniverCity.DTOs.UserDetailDTO;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Quiz.Entities.UserQuiz;
import com.shahroz.UniverCity.Service.UserService;
import com.shahroz.UniverCity.University.University;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user-profile")
@RequiredArgsConstructor
@Tag(name = "User")
public class UserController {

    private  final UserService userService;

    @GetMapping
    ResponseEntity<List<User>> getAllUsers(){

        return ResponseEntity.ok(userService.getAllUsers());

    }
    private final UserProfileService userProfileService;

    @Operation(summary = "Get user profile details")
    @GetMapping("/details")
    public ResponseEntity<?> getUserDetails(Authentication authentication) {
        try {
            UserDetailDTO userDetails = userProfileService.getUserDetails(authentication);
            return ResponseEntity.ok(userDetails);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found.");
        }
    }

    @Operation(summary = "Update user profile details")
    @PutMapping("/edit")
    public ResponseEntity<User> updateUserDetails(
            @Valid @RequestBody UserDetailDTO userDetailDTO,
            Authentication authentication
    ) {
        try {
           return ResponseEntity.ok(userProfileService.updateUserDetails(authentication, userDetailDTO));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

    @Operation(summary = "Get user's favourite universities")
    @GetMapping("/favourites")
    public ResponseEntity<?> getFavouriteUniversities(Authentication authentication) {
        try {
            List<University> universities = userProfileService.getFavouriteUniversities(authentication);
            return ResponseEntity.ok(universities);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Could not fetch favourites.");
        }
    }

    @Operation(summary = "Get user's last five academic scores")
    @GetMapping("/academic-scores")
    public ResponseEntity<?> getAcademicScores(Authentication authentication) {
        try {
            List<UserQuiz> scores = userProfileService.getAcademicScores(authentication);
            return ResponseEntity.ok(scores);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Could not fetch academic scores.");
        }
    }
}
