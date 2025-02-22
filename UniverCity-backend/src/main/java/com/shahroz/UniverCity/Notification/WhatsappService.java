package com.shahroz.UniverCity.Notification;

import jakarta.annotation.PostConstruct;
import lombok.Value;
import org.springframework.stereotype.Service;

@Service
public class WhatsappService {

//    @Value("${twilio.account.sid}")
//    private String accountSid;
//
//    @Value("${twilio.auth.token}")
//    private String authToken;
//
//    @Value("${twilio.whatsapp.from}")
//    private String fromNumber;
//
//    @PostConstruct
//    public void init() {
//        Twilio.init(accountSid, authToken);
//    }
//
//    public void sendWhatsApp(String to, String message) {
//        Message.creator(
//                new PhoneNumber("whatsapp:" + to),
//                new PhoneNumber("whatsapp:" + fromNumber),
//                message
//        ).create();
//    }
}
