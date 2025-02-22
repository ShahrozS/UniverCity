package com.shahroz.UniverCity.Notification;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.*;

@Service
public class WhatsappService {
    private final String PHONE_NUMBER_ID = "580810988445072";
    private final String ACCESS_TOKEN = "EAAZAAk7cy09wBO..."; // Use your actual token

    public String sendWhatsAppTemplateMessage(String recipientNumber, String universityName, String testDate, String websiteLink) {
        String url = "https://graph.facebook.com/v21.0/" + PHONE_NUMBER_ID + "/messages";

        RestTemplate restTemplate = new RestTemplate();

        // Main payload
        Map<String, Object> payload = new HashMap<>();
        payload.put("messaging_product", "whatsapp");
        payload.put("to", recipientNumber);
        payload.put("type", "template");

        // Template details
        Map<String, Object> template = new HashMap<>();
        template.put("name", "entry_test_reminder"); // WhatsApp-approved template name

        Map<String, String> language = new HashMap<>();
        language.put("code", "en_US"); // Adjust if needed
        template.put("language", language);

        // Components (parameters for placeholders)
        List<Map<String, Object>> components = new ArrayList<>();
        Map<String, Object> body = new HashMap<>();
        body.put("type", "body");

        if(websiteLink == null){
            websiteLink = "";
        }
        if(testDate == null){
            testDate = "";
        }
        if(universityName == null){
            universityName = "";
        }
        List<Map<String, String>> parameters = new ArrayList<>();
        parameters.add(Map.of("type", "text", "text", universityName));
        parameters.add(Map.of("type", "text", "text", testDate));
        parameters.add(Map.of("type", "text", "text", websiteLink));

        body.put("parameters", parameters);
        components.add(body);
        template.put("components", components);

        payload.put("template", template);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(ACCESS_TOKEN);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, request, String.class);
            System.out.println("WhatsApp API Response: " + response.getBody());
            return response.getBody();
        } catch (Exception e) {
            System.err.println("Error sending WhatsApp message: " + e.getMessage());
            return "Failed to send WhatsApp message";
        }
    }
}
