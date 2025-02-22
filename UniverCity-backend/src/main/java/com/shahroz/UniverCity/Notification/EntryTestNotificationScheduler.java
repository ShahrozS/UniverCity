package com.shahroz.UniverCity.Notification;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Notification.Favourite.FavouriteUniveristyService;
import com.shahroz.UniverCity.Repositories.UniversityRepository;
import com.shahroz.UniverCity.Service.UserService;
import com.shahroz.UniverCity.University.University;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Component
@EnableScheduling
@RequiredArgsConstructor
public class EntryTestNotificationScheduler {

    private final UniversityRepository universityRepository;
    private final NotificationService notificationService;
    private final FavouriteUniveristyService favouriteUniveristyService;
    private final UserService userService;
    Authentication authentication;

//    @Scheduled(cron = "0 0 12 * * ?")
    @Scheduled(cron = "*/10 * * * * *")
    @Transactional// Runs daily at noon
    public void sendEntryTestNotifications() throws MessagingException {



        List<University> universities = universityRepository.findAll();

        Date currentDate = new Date();
        System.out.println("Working out");
        for (University university : universities) {
            System.out.println("Working start " + university.getEntryTestDate());

            if (university.getEntryTestDate() != null) {
                long daysLeft = ChronoUnit.DAYS.between(
                        currentDate.toInstant(), university.getEntryTestDate().toInstant()
                );
                System.out.println("Working" + daysLeft);
                if (daysLeft == 7 || daysLeft == 1) { // Notify 7 days and 1 day before
                    for (User user : university.getFavoritedByUsers()) {
                        System.out.println(user.fullName() + " --> " + university.getName());
                        notificationService.sendNotification(user, university);
                    }
                }
            }
        }
    }
}
