package com.shahroz.UniverCity.Entities;


import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class Quiz {

    @Id
    private long quiz_id;
    private String subject;
    private String university;


    @OneToMany(mappedBy = "quiz" , cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuizQuestion> questions;

}
