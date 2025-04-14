package com.shahroz.UniverCity.Quiz.Entities.Service;


import com.shahroz.UniverCity.DTOs.QuestionSetDTO;
import com.shahroz.UniverCity.DTOs.UserQuizDTO;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Quiz.Entities.*;
import com.shahroz.UniverCity.Repositories.*;
import com.shahroz.UniverCity.Service.UserService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.domain.Pageable;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

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
    private final UserQuizRepository userQuizRepository;

    public Long addQuestion(QuizQuestionRequest quizQuestionRequest){

        QuizQuestion quizQuestion = quizQuestionMapper.toQuizQuestion(quizQuestionRequest);
        return question.save(quizQuestion).getQuizquestion_id();
    }

    public QuizQuestionResponse getQuestionById(long id){

        return question.findById(id)
                .map(quizQuestionMapper::toQuizQuestionResponse)
                .orElseThrow(()->new EntityNotFoundException("No Question with such ID"+ id));
    }






    //categories extraction
    public Optional<QuizCategory> getCategoryById (long id){
        return quizCategory.findById(id);
    }

    public Optional<QuizSubCategory> getSubCategoryById(long id){
        return quizSubCategoryRepository.findById(id);
    }
    public List<QuizCategory> getMainCategories(){
        return quizCategory.findAll();
    }


    //create quiz
    public UserQuiz createUserQuiz(UserQuizDTO userQuizDTO, Authentication connectedAuthentication) {

        UserQuiz userQuiz = new UserQuiz();

        User user = userService.findUserByEmail(connectedAuthentication.getName()).get();

        userQuiz.setUser(user);
        QuizCategory quizCategory1 = getCategoryById(userQuizDTO.getCategoryId()).get();
        userQuiz.setQuizCategory(quizCategory1);
        userQuiz.setDate(LocalDate.now());
        userQuiz.setScore(userQuizDTO.getScore());
        userQuiz.setCompleted(userQuizDTO.getCompleted());
        userQuiz.setTime(userQuizDTO.getTime());

       return quizRepository.save(userQuiz);

    }

    public List<UserQuiz> getAllUserQuiz(Authentication authentication){
    User user = userService.findUserByEmail(authentication.getName()).get();
    return userQuizRepository.getUserQuizByUser(user);
    }


    public List<UserQuiz> getLastFiveUserQuiz(Authentication authentication){
        User user = userService.findUserByEmail(authentication.getName()).get();
        return userQuizRepository.getLastFiveUserQuizByUser(user);
    }


    //get subcategories by main category
    public List<QuizSubCategory> getSubCategoriesByMainCategory(long maincategory_id){
        return subXMain.findQuizSubCategoryByQuizCategory(getCategoryById(maincategory_id).get());
    }
    //get questions by questionSubMain entity
    public List<QuizQuestion> getQuestionsByCategories(long quizCategory,long quizSubCategory , int limit){
        System.out.println("Category: " + quizCategory);
        QuizCategory quizCategory1 = getCategoryById(quizCategory).get();
        QuizSubCategory quizSubCategory1 = getSubCategoryById(quizSubCategory).get();

        QuizSubCategoryMainCategory quizSubCategoryMainCategory = subXMain.findQuizSubCategoryMainCategoriesByQuizCategoryAndQuizSubCategory(
                quizCategory1
        ,quizSubCategory1);

        Pageable pageable =   PageRequest.of(0,limit);
        return questionSubMainRepository.findQuizQuestionByQuizSubCategoryMainCategory(quizSubCategoryMainCategory,1,pageable).getContent();
    }
    // get all questions by main category
    public List<QuizQuestion> getQuestionsByMainCategory(long category,int difficulty, int totalLimit) {
        QuizCategory quizCategory1 = getCategoryById(category)
                .orElseThrow(() -> new RuntimeException("Category not found"));


        List<QuizSubCategoryMainCategory> quizSubCategoryMainCategories = subXMain
                .findQuizSubCategoryMainCategoriesByQuizCategory(quizCategory1);

        if (quizSubCategoryMainCategories.isEmpty()) {
            return Collections.emptyList();
        }

        List<QuizQuestion> allQuestions = new ArrayList<>();
        int subCategoryCount = quizSubCategoryMainCategories.size();
        int questionsPerSubCategory = totalLimit / subCategoryCount;
        int remainingQuestions = totalLimit % subCategoryCount; // Handle cases where totalLimit isn't perfectly divisible

        for (QuizSubCategoryMainCategory subCategory : quizSubCategoryMainCategories) {

            int limitForThisSubCategory = questionsPerSubCategory + (remainingQuestions-- > 0 ? 1 : 0); // Distribute remaining questions
            System.out.println(quizCategory1.getName() + "---" + subCategory.getQuizSubCategory().getName() + " - " + questionsPerSubCategory + " - " + limitForThisSubCategory);

            Pageable pageable = PageRequest.of(0, limitForThisSubCategory);
            System.out.println(quizCategory1.getName() + subCategory.getQuizSubCategory().getName());
            List<QuizQuestion> questions = questionSubMainRepository
                    .findQuizQuestionByQuizSubCategoryMainCategory(subCategory,difficulty, pageable)
                    .getContent();

            System.out.println("in func");
            for(QuizQuestion quizQuestion: questions ){
                System.out.println(quizQuestion.getDifficultyLevel() + quizQuestion.getQuestion());
            }

            allQuestions.addAll(questions);
        }

        return allQuestions;
    }


    // quiz subxmain
    // 1 1 1
    // 2 1 2
    // 3 2 1
    // 4 2 3

    // question sub main

    // 1 1 1
    // 2 1 2
    // 3 2 1
    //



    //getting question set

    public List<QuizQuestion> getQuizQuestions(QuestionSetDTO questionSetDTO){


        System.out.println( "-->" + questionSetDTO.getCategoryId()+ " " + questionSetDTO.getSubCategoryId() + " " + questionSetDTO.getCount() + " " + questionSetDTO.getDifficulty());

        List<QuizQuestion> questions = getQuestionsByCategories(questionSetDTO.getCategoryId(),questionSetDTO.getSubCategoryId(),questionSetDTO.getCount());
        questions = questions.stream().filter(quizQuestion -> quizQuestion.getDifficultyLevel() == questionSetDTO.getDifficulty()).collect(Collectors.toList());


        Collections.shuffle(questions);

        return questions;


    }


    // get questions by main category only. (with options)
    public List<QuizQuestion> getQuizQuestionsByCategory(QuestionSetDTO questionSetDTO){


        System.out.println( "-->" + questionSetDTO.getCategoryId()+ " " + questionSetDTO.getSubCategoryId() + " " + questionSetDTO.getCount() + " " + questionSetDTO.getDifficulty());

        List<QuizQuestion> questions = getQuestionsByMainCategory(questionSetDTO.getCategoryId(),questionSetDTO.getDifficulty(),questionSetDTO.getCount());

        for(QuizQuestion quizQuestion: questions ){
            System.out.println(quizQuestion.getDifficultyLevel() + quizQuestion.getQuestion());
        }

        questions = questions.stream().filter(quizQuestion -> quizQuestion.getDifficultyLevel() == questionSetDTO.getDifficulty()).collect(Collectors.toList());

        for(QuizQuestion quizQuestion: questions ){
            System.out.println(quizQuestion.getDifficultyLevel() + quizQuestion.getQuestion());
        }

        Collections.shuffle(questions);

        return questions;

    }




}
