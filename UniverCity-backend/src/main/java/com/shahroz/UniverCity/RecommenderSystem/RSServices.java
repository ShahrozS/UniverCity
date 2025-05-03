package com.shahroz.UniverCity.RecommenderSystem;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class RSServices {

    private final RSQuestionsRepository rsQuestionsRepository;


    private final RS_SubQuestionsRepository rsSubQuestionsRepository;



    public List<RS_SubQuestionDTO> getQuestionsByCategoryId(int rscategoryid) {
        List<RS_SubQuestions> questions = rsSubQuestionsRepository.findByRsSubCategoryRsCategoryRscategoryid(rscategoryid);

        return questions.stream().map(question -> {
            RS_SubQuestionDTO dto = new RS_SubQuestionDTO();
            dto.setRssubquestionid(question.getSubrsquestionid());
            dto.setRssubquestion(question.getSubrsquestion());
            dto.setRssubcategoryid(question.getRsSubCategory().getRssubcategoryid());
            return dto;
        }).toList();

    }

    private final Map<String, Integer> likertScores = Map.of(
            "highly_agree", 2,
            "agree", 1,
            "neutral", 0,
            "disagree", -1,
            "highly_disagree", -2
    );

    // Convert RSCategory entity to RSCategoryDTO
    private RSCategoryDTO convertToDTO(RSCategory rsCategory) {
        RSCategoryDTO dto = new RSCategoryDTO();
        dto.setRscategoryid(rsCategory.getRscategoryid());
        dto.setRscategoryname(rsCategory.getRscategoryname());
        return dto;
    }


    public List<RSCategoryDTO> getTop3CategoryRecommendations(Map<Integer, String> userResponses) {
        Map<RSCategory, Integer> categoryScoreMap = new HashMap<>();

        for (Map.Entry<Integer, String> entry : userResponses.entrySet()) {
            int questionId = entry.getKey();
            String response = entry.getValue().toLowerCase();
            int score = likertScores.getOrDefault(response, 0);

            rsQuestionsRepository.findById(questionId).ifPresent(question -> {
                RSCategory category = question.getRsCategory();
                categoryScoreMap.put(category,
                        categoryScoreMap.getOrDefault(category, 0) + score);
            });
        }

        // Sort by score descending and get top 3 categories
        List<RSCategory> topCategories = categoryScoreMap.entrySet()
                .stream()
                .sorted((e1, e2) -> Integer.compare(e2.getValue(), e1.getValue()))
                .limit(3)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());

        // Convert top categories to DTOs
        return topCategories.stream()
                .map(this::convertToDTO)  // convert to RSCategoryDTO
                .collect(Collectors.toList());
    }

    public List<RS_SubCategoryDTO> getTop3SubCategoryRecommendations(Map<Integer, String> userResponses) {
        Map<RS_SubCategory, Integer> subCategoryScoreMap = new HashMap<>();

        for (Map.Entry<Integer, String> entry : userResponses.entrySet()) {
            int subQuestionId = entry.getKey();
            String response = entry.getValue().toLowerCase();
            int score = likertScores.getOrDefault(response, 0);

            rsSubQuestionsRepository.findById(subQuestionId).ifPresent(subQuestion -> {
                RS_SubCategory subCategory = subQuestion.getRsSubCategory();
                subCategoryScoreMap.put(subCategory,
                        subCategoryScoreMap.getOrDefault(subCategory, 0) + score);
            });
        }

        return subCategoryScoreMap.entrySet()
                .stream()
                .sorted((e1, e2) -> Integer.compare(e2.getValue(), e1.getValue()))
                .limit(3)
                .map(entry -> {
                    RS_SubCategoryDTO dto = new RS_SubCategoryDTO();
                    dto.setRssubcategoryid(entry.getKey().getRssubcategoryid());
                    dto.setRssubcategoryname(entry.getKey().getRssubcategoryname());
                    return dto;
                })
                .toList();
    }


    public List<RSQuestions> getQuestions(){
        return rsQuestionsRepository.findAll();
    }

}
