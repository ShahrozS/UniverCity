import { Component, OnInit } from '@angular/core';
import { QuizCategory, QuizQuestion } from '../../../Services/models';
import { getQuizCategories } from '../../../Services/fn/quiz/get-quiz-categories';
import { QuizService } from '../../../Services/services';
import { Router } from '@angular/router';
import { SelectionServiceTsService } from '../selection.service.ts.service';

@Component({
  selector: 'app-quiz-category',
  templateUrl: './quiz-category.component.html',
  styleUrl: './quiz-category.component.scss'
})
export class QuizCategoryComponent implements OnInit {

  quizCategories: QuizCategory[] = [];

  constructor(private quizService: QuizService) {}

  ngOnInit() {
    this.loadCategories();
  }

  loadCategories() {
    this.quizService.getQuizCategories().subscribe(
      (categories) => {
        this.quizCategories = categories;
      },
      (error) => {
        console.error('Error fetching quiz categories:', error);
      }
    );
  }



}
