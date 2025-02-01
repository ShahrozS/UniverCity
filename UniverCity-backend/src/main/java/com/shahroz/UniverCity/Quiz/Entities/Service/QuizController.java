package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityRequest;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import jdk.jfr.Category;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
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

    @GetMapping("/{category_id}/{subcategory_id}")
    public ResponseEntity<List<QuizQuestion>> getQuizBySubCategory(@PathVariable("category_id")long category_id, @PathVariable("subcategory_id") long subcategory_id){


        List<QuizQuestion> questions = quizService.getQuestionsBySubCategory(category_id,subcategory_id);
return ResponseEntity.ok(questions);
    }



}
