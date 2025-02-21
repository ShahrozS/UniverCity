package com.shahroz.UniverCity.Notification;

import com.shahroz.UniverCity.University.University;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("favorites")
@Tag(name = "Quiz")

public class favouriteUniversityController {

    private final favouriteUniveristyService favouriteUniversityService;


    @GetMapping("/exists/{universityId}")
    public ResponseEntity<Boolean> isFavorite(@PathVariable long universityId, Authentication authentication) {
        boolean exists = favouriteUniversityService.isExist(universityId, authentication);
        return ResponseEntity.ok(exists);
    }

    @PostMapping("/{universityId}")
    public ResponseEntity<String> addFavorite(@PathVariable long universityId, Authentication authentication) {
        favouriteUniversityService.addFavouriteUniversity(universityId, authentication);
        return ResponseEntity.ok("University added to favorites.");
    }

    @DeleteMapping("/{universityId}")
    public ResponseEntity<String> removeFavorite(@PathVariable long universityId, Authentication authentication) {
        favouriteUniversityService.deleteFavouriteUniversity(universityId, authentication);
        return ResponseEntity.ok("University removed from favorites.");
    }

    @GetMapping
    public ResponseEntity<List<University>> getFavorites(Authentication authentication) {
        List<University> favoriteUniversities = favouriteUniversityService.getFavouriteUniversities(authentication);
        return ResponseEntity.ok(favoriteUniversities);
    }
}
