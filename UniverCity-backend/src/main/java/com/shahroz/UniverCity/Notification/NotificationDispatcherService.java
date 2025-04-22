package com.shahroz.UniverCity.Notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationDispatcherService {

    private final SimpMessagingTemplate messagingTemplate;


    public void dispatchNotificationUpdate(Long userId, NotificationCountDTO unreadCount) {

        log.info("Sending ws notification to {} with payload {}" , userId, unreadCount);
        System.out.println("In the dispatch method. ");
        messagingTemplate.convertAndSendToUser(String.valueOf(userId), "/notifications" , unreadCount);
    }
}