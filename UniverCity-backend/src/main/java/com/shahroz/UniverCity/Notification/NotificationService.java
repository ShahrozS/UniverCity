package com.shahroz.UniverCity.Notification;

import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.University.University;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private final NotificationEmailService emailService;
    private final WhatsappService whatsAppService;

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

//        emailService.sendEmail(user.getEmail(),user.fullName(), "Upcoming Entry Test Reminder",message);
//        whatsAppService.sendWhatsAppTemplateMessage(user.getPhoneNumber(),university.getName(),formattedDate,university.getWebsiteLink());
    }
}
