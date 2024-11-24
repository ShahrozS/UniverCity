package com.shahroz.UniverCity.Entities;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Data
@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class Notification {

    @Id
    @GeneratedValue

    private long notification_id;

    private String message;
    private Date generatedAt;
    private Date alertAt;
    private boolean read;

    @ManyToOne
    @JoinColumn(
            name = "user_id",
            referencedColumnName = "user_id"
    )
    private User user;






}
