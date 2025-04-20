package com.shahroz.UniverCity.Notification;

import com.shahroz.UniverCity.Entities.Notification;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/notifications")
@RequiredArgsConstructor
@Tag(name = "Notifications")
public class NotificationController {


    private  final NotificationService notificationService;

    @GetMapping("/all-notifications")
    public Page<Notification> getUserNotifications(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            Authentication authentication
    ) {
        // Fetch User from principal (authenticated user)
        return notificationService.getUserNotifications(authentication
                , page, size);
    }

    @GetMapping("/unread-count")
    public ResponseEntity<Long> getUnreadNotificationsCount(Authentication authentication) {
        return ResponseEntity.ok(notificationService.getUnReadCount(authentication));
    }

    @PostMapping("/mark-all-read")
    public ResponseEntity<Void> markAllAsRead(Authentication authentication) {
        notificationService.markAllNotificationsAsRead(authentication);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/mark-open/{id}")
    public ResponseEntity<Void> markAsOpen(@PathVariable("id") Long id){
        notificationService.markAsOpen(id);
        return ResponseEntity.ok().build();
    }





}
