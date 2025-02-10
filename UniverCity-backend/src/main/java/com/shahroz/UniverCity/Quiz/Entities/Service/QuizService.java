package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.DTOs.UserQuizDTO;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.Repositories.*;
import com.shahroz.UniverCity.Service.UserService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
@Slf4j
@Transactional
public class QuizService {
    private final UserService userService;

    private final QuizCategoryRepository quizCategory;
    private final QuizSubCategoryRepository quizSubCategoryRepository;
    private final QuizQuestionRepository question;
    private final UserQuizRepository quizRepository;
    private final QuizQuestionMapper quizQuestionMapper;
    private final QuizSubCategoryMainCategoryRepository subXMain;
    private final QuestionSubMainRepository questionSubMainRepository;
    public Long addQuestion(QuizQuestionRequest quizQuestionRequest){

        QuizQuestion quizQuestion = quizQuestionMapper.toQuizQuestion(quizQuestionRequest);
        return question.save(quizQuestion).getQuizquestion_id();
    }

    public QuizQuestionResponse getQuestionById(long id){

        return question.findById(id)
                .map(quizQuestionMapper::toQuizQuestionResponse)
                .orElseThrow(()->new EntityNotFoundException("No Question with such ID"+ id));
    }





    public List<QuizQuestion> shuffleQuiz;

    //categories extraction
    public Optional<QuizCategory> getCategoryById (long id){
        return quizCategory.findById(id);
    }

//    public Optional<QuizSubCategory> getSubCategoryByMainCategory(QuizCategory quizCategory){
//        return quizSubCategoryRepository.findByQuizCategory(quizCategory);
//    }

    public Optional<QuizSubCategory> getSubCategoryById(long id){
        return quizSubCategoryRepository.findById(id);
    }
    public List<QuizCategory> getMainCategories(){
        return quizCategory.findAll();
    }


    //create quiz
    public void createUserQuiz(UserQuizDTO userQuizDTO, Authentication connectedAuthentication) {

        UserQuiz userQuiz = new UserQuiz();

        User user = userService.findUserByEmail(connectedAuthentication.getName()).get();

        userQuiz.setUser(user);
        QuizCategory quizCategory1 = getCategoryById(userQuizDTO.getCategoryId()).get();
        userQuiz.setQuizCategory(quizCategory1);
        userQuiz.setDate(LocalDate.now());
        userQuiz.setScore(userQuiz.getScore());
        userQuiz.setCompleted(userQuiz.getCompleted());

        quizRepository.save(userQuiz);

    }




    //get subcategories by main category
    public List<QuizSubCategory> getSubCategoriesByMainCategory(long maincategory_id){
        return subXMain.findQuizSubCategoryByQuizCategory(getCategoryById(maincategory_id).get());
    }
    //get questions by questionSubMain entity
    public List<QuizQuestion> getQuestionsByCategories(long quizCategory,long quizSubCategory ){
        QuizCategory quizCategory1 = getCategoryById(quizCategory).get();
        QuizSubCategory quizSubCategory1 = getSubCategoryById(quizSubCategory).get();

        QuizSubCategoryMainCategory quizSubCategoryMainCategory = subXMain.findQuizSubCategoryMainCategoriesByQuizCategoryAndQuizSubCategory(
                quizCategory1
        ,quizSubCategory1);

        return questionSubMainRepository.findQuizQuestionByQuizSubCategoryMainCategory(quizSubCategoryMainCategory);
    }
    //get questions by main category
//    public List<QuizQuestion> getQuestionsByMainCategory(long maincategory_id){
//
//        QuizCategory categoryById = getCategoryById(maincategory_id).get();
//        List<QuizSubCategory> subCategories = subXMain.findQuizSubCategoryByQuizCategory(categoryById);
//
//        for(QuizSubCategory quizSubCategory:subCategories){
//
//
//
//        }
//
//        }



}
