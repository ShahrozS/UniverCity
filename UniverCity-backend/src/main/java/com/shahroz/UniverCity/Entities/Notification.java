package com.shahroz.UniverCity.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.University.University;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Entity
@ToString(exclude = { "user"})
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class Notification {

    @Id
    @GeneratedValue

    private long notification_id;

    private String title;
    private LocalDateTime generatedAt;
    private LocalDateTime alertAt;
    private boolean open;
    private boolean read;
    private String subText;

    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;


    @JsonIgnore
    @ManyToOne
    @JoinColumn(
            name = "user_id"
    )
    private User user;






}
