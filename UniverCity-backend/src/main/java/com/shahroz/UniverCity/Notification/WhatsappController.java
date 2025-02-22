package com.shahroz.UniverCity.Notification;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/whatsapp")
public class WhatsappController {

    @Autowired
    private WhatsappService whatsAppService;

    @PostMapping("/send")
    public String sendMessage(@RequestParam String to, @RequestParam String message) {
        return whatsAppService.sendWhatsAppTemplateMessage(to,"","","");
    }
}
