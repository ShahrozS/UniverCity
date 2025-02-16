import { Component, Input } from '@angular/core';
import { UserQuiz } from '../../../Services/models';
import { QuizService } from '../../../Services/services';
import { animate, state, style, transition, trigger } from '@angular/animations';

@Component({
  selector: 'app-previous-quiz',
  templateUrl: './previous-quiz.component.html',
  styleUrl: './previous-quiz.component.scss',
  animations: [
    trigger('fadeIn', [
      transition(':enter', [
        style({ opacity: 0, transform: 'translateY(20px)' }),
        animate('0.5s ease', style({ opacity: 1, transform: 'translateY(0)' }))
      ])
    ])
  ]
})
export class PreviousQuizComponent {
  userQuizzes: UserQuiz[] = [];

  constructor(private quizService: QuizService) {}

//   ngOnInit(): void {
//     this.getUserQuiz();
//   }


//   getUserQuiz(){

// this.quizService.getUserQuiz().subscribe(
//   (userQuiz)=>{
//     console.log(userQuiz);
//     this.userQuizzes = userQuiz;
//   },
//   (error)=>{
//     console.log(error);
//   }

// )



//   }



quizzes: any[] = []; // Replace with your UserQuiz model
totalQuizzes = 0;
averageScore = '0';

ngOnInit() {
  // Mock data - replace with actual API call
  
  this.totalQuizzes = this.quizzes.length;
  this.calculateAverageScore();
}

private calculateAverageScore() {

  
  // Implement actual calculation based on your score format
  this.averageScore = '8.5';
}

isHighScore(quiz: any): boolean {
  // Implement actual high score logic
  return quiz.score === '9/10';
}


  getUserQuiz(){

this.quizService.getUserQuiz().subscribe(
  (userQuiz)=>{
    console.log(userQuiz);
    this.userQuizzes = userQuiz;
  },
  (error)=>{
    console.log(error);
  }

)


  }
}
