package com.shahroz.UniverCity.RecommenderSystem;

import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class RS_SubCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rssubcategoryid;
    private String rssubcategoryname;
    @ManyToOne
    @JoinColumn(name = "rscategoryid")
    private RSCategory rsCategory;
    @OneToMany(mappedBy = "rsSubCategory",cascade = CascadeType.ALL)
    private List<RS_SubQuestions> rsSubQuestionsList = new ArrayList<>();
}
