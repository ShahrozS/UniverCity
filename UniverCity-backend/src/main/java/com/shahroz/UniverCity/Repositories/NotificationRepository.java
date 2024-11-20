package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
}
