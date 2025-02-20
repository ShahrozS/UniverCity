import { Component, HostListener, OnInit } from '@angular/core';
import confetti from 'canvas-confetti';
import { SelectionServiceTsService } from '/FYP/Code/UniverCity/UniverCity-ui/src/app/Pages/quiz/selection.service.ts.service';
import { QuizService } from '../../../Services/services';
import { QuizCategory } from '../../../Services/models';
import { ActivatedRoute, Router } from '@angular/router';
import { faArrowDown } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-quiz-result',
  templateUrl: './quiz-result.component.html',
  styleUrls: ['./quiz-result.component.scss'],
  
})
export class QuizResultComponent implements OnInit {
  quizTitle ?= '';  // Change dynamically if needed
  score ?= 0; // Example score, replace with actual result
  totalQuestions ?= 0;
  difficulty ?=0;
  time?="";
  mode?="";

  faArrowDown = faArrowDown;
  breakdown = [
    { section: 'Math', correct: 5, total: 7 },
    { section: 'Science', correct: 6, total: 7 },
    { section: 'History', correct: 4, total: 6 },
  ];
  results: { subCategory: string, correct: number, total: number }[] = [];

  category!: QuizCategory ;
  constructor(
    private router: Router,
    private route: ActivatedRoute
    ,public selectionService: SelectionServiceTsService,
     private quizService: QuizService) {}

  ngOnInit(): void {
    this.selectionService.loadFromStorage(); 
    console.log(this.selectionService.getTime());
    console.log(this.selectionService.getMode());
    console.log(this.selectionService.getQuestionCount());
    console.log(this.selectionService.getDifficulty());
    console.log("--------------------------")
    this.time = this.selectionService.getTime();
    this.difficulty = this.selectionService.getDifficulty();
    this.mode = this.selectionService.getMode();

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

  temp = 0;

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

  //handeling the scrollng 

  showScrollButton = true;

  @HostListener('window:scroll', [])
  onWindowScroll() {
    // Detect scroll position
    const scrollPosition = window.scrollY + window.innerHeight;
    const pageHeight = document.documentElement.scrollHeight;
    
    // Show button if user is not at the bottom
    this.showScrollButton = scrollPosition < pageHeight - 50;
  }
  scrollToBottom() {
    window.scrollTo({ top: document.body.scrollHeight, behavior: 'smooth' });
  }
}
