package com.shahroz.UniverCity.RecommenderSystem;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class RSCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rscategoryid;
    private String rscategoryname;
    @OneToMany(mappedBy = "rsCategory",cascade = CascadeType.ALL)
    private List<RSQuestions> rsQuestionsList = new ArrayList<>();
    @OneToMany(mappedBy = "rsCategory",cascade = CascadeType.ALL)
    private List<RS_SubCategory> rsSubCategories = new ArrayList<>();
}
