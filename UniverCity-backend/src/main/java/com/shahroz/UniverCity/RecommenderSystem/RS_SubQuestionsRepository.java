package com.shahroz.UniverCity.RecommenderSystem;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RS_SubQuestionsRepository extends JpaRepository<RS_SubQuestions,Integer> {
    List<RS_SubQuestions> findByRsSubCategoryRsCategoryRscategoryid(int rscategoryid);
}
