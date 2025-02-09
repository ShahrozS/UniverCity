import { Component, OnInit } from '@angular/core';
import confetti from 'canvas-confetti';
import { SelectionServiceTsService } from '/FYP/Code/UniverCity/UniverCity-ui/src/app/Pages/quiz/selection.service.ts.service';

@Component({
  selector: 'app-quiz-result',
  templateUrl: './quiz-result.component.html',
  styleUrls: ['./quiz-result.component.scss']
})
export class QuizResultComponent implements OnInit {
  quizTitle = 'General Knowledge Quiz';  // Change dynamically if needed
  score = 85; // Example score, replace with actual result
  totalQuestions = 20;
  breakdown = [
    { section: 'Math', correct: 5, total: 7 },
    { section: 'Science', correct: 6, total: 7 },
    { section: 'History', correct: 4, total: 6 },
  ];

  constructor(public selectionService: SelectionServiceTsService) {}

  ngOnInit(): void {
    this.totalQuestions = parseInt(this.selectionService.getQuestionCount()) || 20;

    confetti({
      particleCount: 100,
      spread: 70,
      origin: { y: 0.6 }
    });
  }

  getScorePercentage(): number {
    return (this.score / this.totalQuestions) * 100;
  }

  retryQuiz(){

  }
  goHome(){

  }
}
