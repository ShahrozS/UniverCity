import { Component } from '@angular/core';
import { SelectionServiceTsService } from '../selection.service.ts.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-quiz-options',
  templateUrl: './quiz-options.component.html',
  styleUrl: './quiz-options.component.scss'
})
export class QuizOptionsComponent {
  constructor(public selectionService: SelectionServiceTsService,
    private router: Router
  ) {}




  Continue(){
    this.router.navigate(['mock-test']);
    console.log("Mode:", this.selectionService.getMode());
    console.log("Category:", this.selectionService.getCategory());
    console.log("Sub:", this.selectionService.getSubCategory());
    console.log("Difficulty:", this.selectionService.getDifficulty());
    console.log("Count:", this.selectionService.getQuestionCount());
    console.log("Time:", this.selectionService.getTime());




  }
}
