package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.DTOs.QuestionSetDTO;
import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityRequest;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jdk.jfr.Category;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("quiz")
@RequiredArgsConstructor
@Tag(name = "Quiz")
public class QuizController {


    private final QuizService quizService;
    private final QuizQuestionMapper mapper;



    @PostMapping
    public ResponseEntity<Long> saveQuizQuestion(
            @Valid @RequestBody QuizQuestionRequest quizQuestionRequest
    ){
        return ResponseEntity.ok(quizService.addQuestion(quizQuestionRequest));
    }

    @GetMapping("getQuizBySub/{category_id}/{subcategory_id}")
    public ResponseEntity<List<QuizQuestion>> getQuizBySubCategory(@PathVariable("category_id")long category_id, @PathVariable("subcategory_id") long subcategory_id){


        List<QuizQuestion> questions = quizService.getQuestionsByCategories(category_id,subcategory_id,5);
return ResponseEntity.ok(questions);
    }

    @GetMapping("getSubCategory/{category_id}")
    public ResponseEntity<List<QuizSubCategory>> getSubCategoryByCategory(@PathVariable("category_id")long category_id){

        return ResponseEntity.ok(quizService.getSubCategoriesByMainCategory(category_id));
    }

    @GetMapping("/categories")
    public ResponseEntity<List<QuizCategory>> getQuizCategories(){

        return ResponseEntity.ok(quizService.getMainCategories());
    }
    @PostMapping("/questionSet")
    public ResponseEntity<List<QuizQuestion>> getQuizQuestions(@RequestBody QuestionSetDTO questionSetDTO){

        return ResponseEntity.ok(quizService.getQuizQuestions(questionSetDTO));

    }

    @PostMapping("/questionSetByMain")
    public ResponseEntity<List<QuizQuestion>> getQuizQuestionsByMainCategory(@RequestBody QuestionSetDTO questionSetDTO){
        return ResponseEntity.ok(quizService.getQuizQuestionsByCategory(questionSetDTO));
    }




}
