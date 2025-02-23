import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { QuizService } from '../../../Services/services';
import { SelectionServiceTsService } from '../selection.service.ts.service';
import { QuizQuestion, QuizSubCategory } from '../../../Services/models';
import { Router } from '@angular/router';

interface Question {
  id: number;
  text: string;
  options: string[];
  sectionId: number;
}

interface Section {
  id: number;
  title: string;
}


@Component({
  selector: 'app-mock-test',
  templateUrl: './mock-test.component.html',
  styleUrl: './mock-test.component.scss'
})
export class MockTestComponent {
  quizForm: FormGroup;
  timer: string = '00:00';
  startTime!: number; // 30 minutes in seconds
  score!:number;
  subCategories: QuizSubCategory[] = [];
  mode!:string;
  questions: QuizQuestion[] = [];




  constructor(private fb: FormBuilder
    , private quizService: QuizService
    , private service:SelectionServiceTsService
    , private router:Router) {
    this.quizForm = this.fb.group({});
    this.questions.forEach(q => {
      this.quizForm.addControl('question' + q.quizquestion_id, this.fb.control(''));
    });
  }
  ngOnInit() {

        
    console.log(this.service.getTime());
    console.log(this.service.getMode());
    console.log(this.service.getQuestionCount());
    console.log(this.service.getDifficulty());
    console.log("--------------------------")
    //time extraction 
    const rawTime = this.service.getTime(); // e.g., "10 min"
    const extractedTime = rawTime ? parseInt(rawTime.match(/\d+/)?.[0] || "0", 10) : 0;
    this.startTime = extractedTime * 60; // Convert minutes to seconds
    this.quizForm = this.fb.group({});
    if(this.service.getMode() === "Timed"){
      this.startTimer();
    }
    this.loadSubCategories();
    this.getQuestions();
    this.mode = this.service.getMode() ?? "";
  
  }
  
  updateFormControls() {
    this.questions.forEach(q => {
      this.quizForm.addControl('question' + q.quizquestion_id, this.fb.control(''));
    });
  }
  

  loadSubCategories() {

    const category = this.service.getCategory() ?? 0;

    this.quizService.getSubCategoryByCategory({ category_id: category }).subscribe(
      (subCategories) => {
    console.log("" + this.subCategories);

        this.subCategories=subCategories;
      },
      (error) => {
        console.error('Error fetching quiz categories:', error);
      }
    );


  }

  getQuestions(){
    this.quizService.getQuizQuestionsByMainCategory({
      body: {
        difficulty: this.service.getDifficulty(),
        subCategoryId: 0,
        categoryId: this.service.getCategory(),
        count: this.service.getQuestionCount()
      }
    }).subscribe(
      (questions: QuizQuestion[]) => {
        this.questions = questions;
        console.log("Fetched Questions:", this.questions);
        this.updateFormControls();
      },
      (error) => {
        console.error("Error fetching questions:", error);
      }
    );
  }
  



  startTimer() {
    const timer = setInterval(() => {
      if (this.startTime > 0) {
        this.startTime--;
        const minutes = Math.floor(this.startTime / 60);
        const seconds = this.startTime % 60;
        this.timer = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
      } else {
        clearInterval(timer);
        this.onSubmit();
      }
    }, 1000);
  }

  getQuestionsForSection(sectionId: number): QuizQuestion[] {
    return this.questions.filter(q => q.questionSubMains?.some(sub => sub.quizSubCategoryMainCategory?.quizSubCategory?.quizsubcategory_id === sectionId));
  }
  
  

  isOptionSelected(questionId: number, optionIndex: number): boolean {
    return this.quizForm.get('question' + questionId)?.value === optionIndex;
  }

  onOptionSelect(questionId: number, optionIndex: number) {
    this.quizForm.patchValue({ ['question' + questionId]: optionIndex });
    console.log(    )
  }



getOptionText(question: QuizQuestion, optionIndex: number): string {
  const key = `option${optionIndex}` as keyof QuizQuestion;
  return question[key] as string ?? '';
}


getPreviousQuestionsCount(subCategoryIndex: number): number {
  let count = 0;
  for (let i = 0; i < subCategoryIndex; i++) {
    count += this.getQuestionsForSection(this.subCategories[i].quizsubcategory_id ?? 0).length;
  }
  return count;
}
correctAnswers = 0;


  userQuiz:{score:string,categoryId:number,completed:number,time:string}={
    score: "0",
    categoryId:0,
    completed:0,
    time:"",
  };

calculateCorrectAnswers(){
  let totalQuestions = this.service.getQuestionCount();

  this.subCategories.forEach(subCategory => {
    let questions = this.getQuestionsForSection(subCategory.quizsubcategory_id ?? 0);
    questions.forEach(question => {
      const selectedOption = this.quizForm.get('question' + question.quizquestion_id)?.value;
      const selectedOptionText = this.getOptionText(question, selectedOption); // Get actual option text

      if (selectedOptionText.trim().toLowerCase() === String(question.correctAnswer).trim().toLowerCase()) {
        // Assuming correctOption exists
       this.correctAnswers++;
  
      }
    });
    console.log( "Correct Answers-->" + this.correctAnswers);
    
  });




  this.userQuiz.categoryId = this.service.getCategory() ?? 0;
  this.userQuiz.score = this.correctAnswers + "/" + this.service.getQuestionCount();
  this.userQuiz.completed = (this.correctAnswers/(this.service.getQuestionCount()??1))*100 ; 
  this.userQuiz.time = this.service.getTime();


  console.log("ScorE: " + this.userQuiz.score);
  this.service.setScore(this.correctAnswers);

  console.log("UserQuiz: " + this.userQuiz);
};

saveUserQuiz(){
  console.log("In save user quiz");
  this.quizService.createUserQuiz({
    body:
    {
      categoryId: this.service.getCategory(),
completed:this.userQuiz.completed,
score:this.userQuiz.score,
time:this.userQuiz.time
    }
  }).subscribe(
    (userQuiz)=>{
      console.log("Saved User Quiz Succesfully"+JSON.stringify(userQuiz));
    },
    (error)=>{
      console.log("Error saving quiz: " + error);
    }


  );


};



onSubmit() {
  const results: { subCategory: string, correct: number, total: number }[] = [];


  
 

  // calculating score 
this.calculateCorrectAnswers();
this.saveUserQuiz();


  this.subCategories.forEach(subCategory => {
    const subCategoryId = subCategory.quizsubcategory_id ?? 0;
    const subCategoryQuestions = this.getQuestionsForSection(subCategoryId);

    let correctCount = 0;
    subCategoryQuestions.forEach(question => {
      const selectedOption = this.quizForm.get('question' + question.quizquestion_id)?.value;
      const selectedOptionText = this.getOptionText(question, selectedOption); // Get actual option text
      console.log(selectedOptionText.trim().toLowerCase()+ "===" +String(question.correctAnswer).trim().toLowerCase())

      if (selectedOptionText.trim().toLowerCase() === String(question.correctAnswer).trim().toLowerCase()) {
        correctCount++;
      }
    });

    results.push({
      subCategory: subCategory.name??'',
      correct: correctCount,
      total: subCategoryQuestions.length
    });
  });

  console.log("Quiz Results:", results);
  this.service.setQuizResults(results);
  console.log("Getting back: " + JSON.stringify( this.service.getQuizResults())); // Store results for results page
  this.router.navigate(['/quiz-result'],
  {  queryParams: {
      results: JSON.stringify(results)
    }}
  ); // Redirect to results page
}




goBack(){
  this.router.navigate(['/quiz-options']);
}
}
