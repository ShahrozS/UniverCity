import { Component, OnInit } from '@angular/core';
import confetti from 'canvas-confetti';
import { SelectionServiceTsService } from '/FYP/Code/UniverCity/UniverCity-ui/src/app/Pages/quiz/selection.service.ts.service';
import { QuizService } from '../../../Services/services';
import { QuizCategory } from '../../../Services/models';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-quiz-result',
  templateUrl: './quiz-result.component.html',
  styleUrls: ['./quiz-result.component.scss']
})
export class QuizResultComponent implements OnInit {
  quizTitle ?= '';  // Change dynamically if needed
  score ?= 0; // Example score, replace with actual result
  totalQuestions ?= 0;
  breakdown = [
    { section: 'Math', correct: 5, total: 7 },
    { section: 'Science', correct: 6, total: 7 },
    { section: 'History', correct: 4, total: 6 },
  ];
  results: { subCategory: string, correct: number, total: number }[] = [];

  category!: QuizCategory ;
  constructor(private route: ActivatedRoute,public selectionService: SelectionServiceTsService, private quizService: QuizService) {}

  ngOnInit(): void {
    this.totalQuestions = this.selectionService.getQuestionCount() || 20;
    this.quizTitle = this.selectionService.getCategoryName();
    confetti({
      particleCount: 100,
      spread: 70,
      origin: { y: 0.6 }
    });
    this.route.queryParams.subscribe(params => {
      console.log("--->"+JSON.parse(params['results']))
      this.results = JSON.parse(params['results']);
    })

    this.score = this.selectionService.getScore();
    this.totalQuestions = this.selectionService.getQuestionCount();
    console.log(this.selectionService.getScore() + " : " +   this.selectionService.getQuestionCount() )
  }

  getScorePercentage(): number {
    return (this.score??1 /( this.totalQuestions ?? 1)) * 100;
  }





  // get category name 




  // get Sub Categories name 

  // loadSubCategories() {

  //   const category = this.selectionService.getCategory() ?? 0;

  //   this.quizService.getSubCategoryByCategory({ category_id: category }).subscribe(
  //     (subCategories) => {
  //   console.log("" + this.subCategories);

  //       this.subCategories=subCategories;
  //     },
  //     (error) => {
  //       console.error('Error fetching quiz categories:', error);
  //     }
  //   );


  // }


  retryQuiz(){

  }
  goHome(){

  }
}
