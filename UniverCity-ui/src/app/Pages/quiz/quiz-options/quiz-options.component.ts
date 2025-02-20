import { Component } from '@angular/core';
import { SelectionServiceTsService } from '../selection.service.ts.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-quiz-options',
  templateUrl: './quiz-options.component.html',
  styleUrl: './quiz-options.component.scss'
})
export class QuizOptionsComponent {
  constructor(public selectionService: SelectionServiceTsService, private router: Router) {}

  loading = false;

  // Temporary variables to store selected options
  selectedMode: string = "";
  selectedTime: string = "";
  selectedDifficulty: string = "";
  selectedQuestionCount: string = "";
  selectedCategory: number = 0;
  selectedSubCategory: number = 0;

  Continue() {
    this.loading = true; // Start loading animation

    setTimeout(() => {
      // Save the selected options to the service
      this.selectionService.setMode(this.selectedMode);
      this.selectionService.setTime(this.selectedTime);
      this.selectionService.setDifficulty(this.selectedDifficulty);
      this.selectionService.setQuestionCount(this.selectedQuestionCount);
      this.selectionService.setCategory(this.selectedCategory);
      this.selectionService.setSubCategory(this.selectedSubCategory);

      // Stop loading and navigate
      this.loading = false;
      this.router.navigate(['mock-test']);

      // Logging saved values
      console.log("Mode:", this.selectedMode);
      console.log("Category:", this.selectedCategory);
      console.log("SubCategory:", this.selectedSubCategory);
      console.log("Difficulty:", this.selectedDifficulty);
      console.log("Question Count:", this.selectedQuestionCount);
      console.log("Time:", this.selectedTime);
    }, 2000); // Simulated delay
  }
}
