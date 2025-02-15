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

  subCategories: QuizSubCategory[] = [];

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

    //time extraction 
    const rawTime = this.service.getTime(); // e.g., "10 min"
    const extractedTime = rawTime ? parseInt(rawTime.match(/\d+/)?.[0] || "0", 10) : 0;
    this.startTime = extractedTime * 60; // Convert minutes to seconds
    
    this.quizForm = this.fb.group({});
    this.startTimer();
    this.loadSubCategories();
    this.getQuestions();
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
  }



getOptionText(question: QuizQuestion, optionIndex: number): string {
  const key = `option${optionIndex}` as keyof QuizQuestion;
  return question[key] as string ?? '';
}


onSubmit() {
  const results: { subCategory: string, correct: number, total: number }[] = [];

  this.subCategories.forEach(subCategory => {
    const subCategoryId = subCategory.quizsubcategory_id ?? 0;
    const subCategoryQuestions = this.getQuestionsForSection(subCategoryId);

    let correctCount = 0;
    subCategoryQuestions.forEach(question => {
      const selectedOption = this.quizForm.get('question' + question.quizquestion_id)?.value;
      if (selectedOption === question.correctAnswer) {
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
  this.service.setQuizResults(results); // Store results for results page
  this.router.navigate(['/quiz-result']); // Redirect to results page
}

}
