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
  
  this.getUserQuiz();
}

private calculateAverageScore() {

  if (this.quizzes.length === 0) {
    this.averageScore = "0";
    return;
  }

  let totalScore = 0;
  let totalQuestions = 0;

  this.quizzes.forEach(quiz => {
    console.log("quiz-->"+ quiz);
    if (quiz.score) {
      const parts = quiz.score.split('/').map(Number);
      console.log("parts: " + parts);
      // Ensure split happens safely
      if (parts.length === 2 && !isNaN(parts[0]) && !isNaN(parts[1])) {
        totalScore += parts[0];
        totalQuestions += parts[1];
      }
    }
  });

  let x  = totalQuestions ? (totalScore / totalQuestions)*10 : 0;
  this.averageScore = ""+x.toFixed(1);
}

isHighScore(quiz: any): boolean {
  // Implement actual high score logic
  return quiz.score === '9/10';
}


  getUserQuiz(){

this.quizService.getUserQuiz().subscribe(
  (userQuiz)=>{
    console.log(userQuiz);
    this.totalQuizzes = userQuiz.length;
    this.quizzes = userQuiz;
    this.calculateAverageScore();
  
  },
  (error)=>{
    console.log(error);
  }

)


  }
}
