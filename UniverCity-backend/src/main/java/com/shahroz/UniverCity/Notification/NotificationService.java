package com.shahroz.UniverCity.Notification;

import com.shahroz.UniverCity.Entities.Notification;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Repositories.NotificationRepository;
import com.shahroz.UniverCity.Repositories.UserRepository;
import com.shahroz.UniverCity.University.University;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {

    private final NotificationEmailService emailService;
    private final WhatsappService whatsAppService;
    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;
    private final NotificationDispatcherService dispatcherService;
    private final SimpMessagingTemplate messagingTemplate;


    public void sendNotification(User user, University university) throws MessagingException {

        String formattedDate = new SimpleDateFormat("EEEE, MMMM d, yyyy 'at' hh:mm a").format(university.getEntryTestDate());

        String message = String.format(
                "<html>" +
                        "<body style='font-family: Arial, sans-serif; color: #333;'> " +
                        "<h2 style='color: #0056b3;'> Exciting News, Future Scholar! </h2>" +
                        "<p>Your journey to <strong>%s</strong> is about to take off! </p>" +
                        "<p>The big day is coming up on <strong style='color: #d9534f;'>%s</strong> – mark your calendar! 🗓️</p>" +
                        "<p>🔗 <a href='%s' style='color: #007bff; text-decoration: none;'>More Info</a></p>" +
                        "<p>Don’t wait until the last minute—revise, stay confident, and ace that test! 🏆</p>" +
                        "<br>" +
                        "<p>Best of luck!</p>" +
                        "<p>🎓 <strong>The UniverCity Team</strong></p>" +
                        "</body>" +
                        "</html>",
                university.getName(), formattedDate, university.getWebsiteLink()
        );

        String whatsappMessage = "ALERT🚨. \n"+university.getName()+"'s entry test is just around the corner!\n 📆Date: " + formattedDate + ".\n For more details visit: " + university.getWebsiteLink();

        emailService.sendEmail(user.getEmail(),user.fullName(), "Upcoming Entry Test Reminder",message);
        whatsAppService.sendWhatsAppTemplateMessage(user.getPhoneNumber(),university.getName(),formattedDate,university.getWebsiteLink());

        String notificationMessage = university.getName()+ "'s entry test is just around the corner!";
        String subText = university.getName()+"'s entry test is scheduled at " + university.getEntryTestDate();

        //saving the notification
        Notification notification = new Notification();

        notification.setUser(user);
        notification.setRead(false);
        notification.setTitle(notificationMessage);
        notification.setSubText(subText);
        notification.setUniversity(university);
        notification.setGeneratedAt(LocalDateTime.now());
        notification.setOpen(false);

        notificationRepository.save(notification);

        Long unreadCount = notificationRepository.countByUserAndRead(user);
            dispatcherService.dispatchNotificationUpdate(notification.getUser().getUser_id(), NotificationCountDTO.builder().unReadCount(unreadCount).build());

    }

    public Page<Notification> getUserNotifications(Authentication authentication, int page, int size){
        User user = userRepository.findByEmail(authentication.getName()).get();
        Pageable pageable = PageRequest.of(page, size, Sort.by("generatedAt").descending());
        return notificationRepository.getNotificationsByUser(user,pageable);
    }


    public void markAsRead(Long notification_id){
        Notification notification = notificationRepository.findById(notification_id).get();
        if(!notification.isRead()){
            notification.setRead(true);
        }
        notificationRepository.save(notification);
    }
    public void markAsOpen(Long notification_id){

        Notification notification = notificationRepository.findById(notification_id).get();
        if(!notification.isOpen()){
            notification.setOpen(true);
        }
        notificationRepository.save(notification);
    }

    public Long getUnReadCount(Authentication authentication){

        User user = userRepository.findByEmail(authentication.getName()).get();

        return notificationRepository.countByUserAndRead(user);
    }


    @Transactional
    public void markAllNotificationsAsRead(Authentication authentication) {
        List<Notification> notifications = notificationRepository.findByUserAndReadFalse(userRepository.findByEmail(authentication.getName()).get());
        notifications.forEach(n -> n.setRead(true));
        notificationRepository.saveAll(notifications);
    }

    public int countOfNotificationsByUserAndUniversity(User user, University university)
    {
        List<Notification> notifications = notificationRepository.findByUserAndUniversity(user, university);
        return notifications.size();
    }

}
