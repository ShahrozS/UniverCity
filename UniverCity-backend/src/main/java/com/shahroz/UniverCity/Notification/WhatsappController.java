package com.shahroz.UniverCity.Notification;


import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/whatsapp")
@RequiredArgsConstructor
public class WhatsappController {

    @Autowired
    private WhatsappService whatsAppService;

    private final NotificationService notificationService;

    @PostMapping("/send")
    public String sendMessage(@RequestParam String to, @RequestParam String message) {
        return whatsAppService.sendWhatsAppTemplateMessage(to,"","","");
    }


}
