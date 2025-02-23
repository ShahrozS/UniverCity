package com.shahroz.UniverCity.Notification;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.*;

@Service
public class WhatsappService {
    private static final String PHONE_NUMBER_ID = "580810988445072";
    private static final String ACCESS_TOKEN = "EAAZAAk7cy09wBOZBlSLi2EWsZCOdok5Oa9Ug8GaeujgVsjqeDbjoCal0ZBgS3hHBYExUlBUhHDgRzUl8HwsxUmhBGRJStCZAJf9wNiJm6v2aahop6RHpS8rPf7QiFyWv7hi5eJ2TJs5gw9Cqt6K5c0NQPBHQALT5AzW9ZBapAzZCHW3EPumfJugrS9VCzJYvu0OGObmzAlR9doKWZABAClFIE1uwbzgZD"; // Replace with actual token
    private static final String API_URL = "https://graph.facebook.com/v21.0/" + PHONE_NUMBER_ID + "/messages";

    public String sendWhatsAppTemplateMessage(String recipientNumber, String universityName, String testDate, String websiteLink) {
        RestTemplate restTemplate = new RestTemplate();

        // Ensure non-null values
        universityName = (universityName != null) ? universityName : "";
        testDate = (testDate != null) ? testDate : "";
        websiteLink = (websiteLink != null) ? websiteLink : "";

        // Create message payload
        Map<String, Object> payload = new HashMap<>();
        payload.put("messaging_product", "whatsapp");
        payload.put("to", recipientNumber);
        payload.put("type", "template");

        // Template configuration
        Map<String, Object> template = new HashMap<>();
        template.put("name", "entry_test_reminder"); // Approved WhatsApp template name

        Map<String, String> language = new HashMap<>();
        language.put("code", "en_US"); // Ensure language is correct
        template.put("language", language);

        // Parameters with names
        List<Map<String, Object>> parameters = List.of(
                Map.of("type", "text", "parameter_name", "university_name", "text", universityName),
                Map.of("type", "text", "parameter_name", "date", "text", testDate),
                Map.of("type", "text", "parameter_name", "website_link", "text", websiteLink)
        );

        // Components with body parameters
        Map<String, Object> bodyComponent = new HashMap<>();
        bodyComponent.put("type", "body");
        bodyComponent.put("parameters", parameters);

        template.put("components", List.of(bodyComponent));
        payload.put("template", template);

        // Set HTTP headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(ACCESS_TOKEN);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(API_URL, HttpMethod.POST, request, String.class);
            System.out.println("WhatsApp API Response: " + response.getBody());
            return response.getBody();
        } catch (Exception e) {
            System.err.println("Error sending WhatsApp message: " + e.getMessage());
            return "Failed to send WhatsApp message";
        }
    }
}
