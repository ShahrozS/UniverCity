package com.shahroz.UniverCity.security.email;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import static java.nio.charset.StandardCharsets.UTF_8;
import static org.springframework.mail.javamail.MimeMessageHelper.MULTIPART_MODE_MIXED;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmailService {
    private final JavaMailSender mailSender;

    @Async
    public void sendEmail(
            String to,
            String username,
            String confirmationUrl,
            String activationCode,
            String subject
    ) throws MessagingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(
                mimeMessage,
                MULTIPART_MODE_MIXED,
                UTF_8.name()
        );

        helper.setFrom("UniverCity.FYP@gmail.com");
        helper.setTo(to);
        helper.setSubject(subject);

        // Embedded HTML with placeholders replaced via String.format
        String htmlContent = String.format("""
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <title>Account Activation</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
                    .container { max-width: 600px; margin: 10px auto; padding: 20px; background-color: #fff;
                        border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
                    .activation-code { font-size: 36px; text-align: center; margin-bottom: 20px; }
                    .activation-link { text-align: center; margin-top: 20px; }
                    .activation-link a { display: inline-block; padding: 10px 20px; background-color: #007bff;
                        color: #fff; text-decoration: none; border-radius: 5px; }
                </style>
            </head>
            <body>
            <div class="container">
                <h1>Account Activation</h1>
                <p>Hello %s,</p>
                <p>Thank you for signing up! Please use the following activation code to activate your account:</p>
                <div class="activation-code">%s</div>
                <div class="activation-link">
                    <a href="%s" target="_blank">Activate your account</a>
                </div>
            </div>
            </body>
            </html>
            """, username, activationCode, confirmationUrl);

        helper.setText(htmlContent, true);  // true = isHtml

        mailSender.send(mimeMessage);
    }
}
