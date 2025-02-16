import { Component, Input } from '@angular/core';
import { UserQuiz } from '../../../Services/models';
import { QuizService } from '../../../Services/services';

@Component({
  selector: 'app-previous-quiz',
  templateUrl: './previous-quiz.component.html',
  styleUrl: './previous-quiz.component.scss'
})
export class PreviousQuizComponent {
  userQuizzes: UserQuiz[] = [];

//   constructor(private quizService: QuizService) {}

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
  this.quizzes = [
    {
      date: new Date('2023-03-15'),
      score: '8/10',
      completed: 0.8,
      quizCategory: { name: 'Math' },
      timeTaken: '12:30'
    },
    {
      date: new Date('2023-03-18'),
      score: '9/10',
      completed: 1,
      quizCategory: { name: 'Science' },
      timeTaken: '15:45'
    }
  ];

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


}
