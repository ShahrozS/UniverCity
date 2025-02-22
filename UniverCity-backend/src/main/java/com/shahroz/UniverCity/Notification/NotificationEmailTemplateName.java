package com.shahroz.UniverCity.Notification;

import lombok.Getter;

@Getter
public enum NotificationEmailTemplateName {

    NOTIFY_USER("notification-email")
    ;


    private final String name;
    NotificationEmailTemplateName(String name) {
        this.name = name;
    }
}