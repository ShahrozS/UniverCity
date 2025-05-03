package com.shahroz.UniverCity.RecommenderSystem;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class RS_SubQuestions {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int subrsquestionid;
    private String subrsquestion;
    @ManyToOne
    @JoinColumn(name = "rssubcategoryid")
    private RS_SubCategory rsSubCategory;
}
