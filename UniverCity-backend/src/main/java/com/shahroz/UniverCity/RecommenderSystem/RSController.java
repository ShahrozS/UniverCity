package com.shahroz.UniverCity.RecommenderSystem;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/recommenderSystem")
@RequiredArgsConstructor
public class RSController {
    private final RSServices rsCategoryService;


    @PostMapping("/categoryRecommendation")
    public List<RSCategoryDTO> getTop3(@RequestBody Map<Integer, String> responses) {
        return rsCategoryService.getTop3CategoryRecommendations(responses);
    }

    @PostMapping("/categoryQuestions")
    public List<RS_SubQuestionDTO> getQuestionsByCategory(@RequestBody Map<String, Object> request) {
        // Extract categoryId and categoryName from the request
        int categoryId = (int) request.get("rscategoryid");
        String categoryName = (String) request.get("rscategoryname");

        return rsCategoryService.getQuestionsByCategoryId(categoryId);
    }

    @PostMapping("/subcategoryRecommendation")
    public List<RS_SubCategoryDTO> getTop3Sub(@RequestBody Map<Integer, String> request) {
        return rsCategoryService.getTop3SubCategoryRecommendations(request);
    }

    @GetMapping("/questions")
    public ResponseEntity<?> getQuestions(){
        List<RSQuestions> questions =  rsCategoryService.getQuestions();
        if(questions != null && !questions.isEmpty()){
            return new ResponseEntity<>(questions.stream().map(question -> {
                RSQuestionDTO dto = new RSQuestionDTO();
                dto.setRsquestionid(question.getRsquestionid());
                dto.setRsquestion(question.getRsquestion());
                dto.setRscategoryid(question.getRsCategory().getRscategoryid());
                dto.setRscategory(question.getRsCategory().getRscategoryname());
                return dto;
            }).collect(Collectors.toList()), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
