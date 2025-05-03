package com.shahroz.UniverCity.RecommenderSystem;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class RSQuestions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rsquestionid;
    private String rsquestion;
    @ManyToOne
    @JoinColumn(name = "rscategoryid")
    private RSCategory rsCategory;
}
