package com.shahroz.UniverCity.Repositories;

import com.shahroz.UniverCity.Entities.Notification;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.University.University;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, Long> {

    public Page<Notification> getNotificationsByUser(User user, Pageable pageable);


    @Query("select count(n) from Notification n where n.user = :user and n.read = false")
    Long countByUserAndRead(@Param("user") User user);

    public List<Notification> findByUserAndReadFalse(User user);


    public List<Notification> findByUserAndUniversity(User user, University university);


}
