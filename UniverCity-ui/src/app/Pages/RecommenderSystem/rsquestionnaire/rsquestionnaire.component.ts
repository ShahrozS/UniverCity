

import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { RsControllerService } from '../../../Services/services';

@Component({
  selector: 'app-rsquestionnaire',
  templateUrl: './rsquestionnaire.component.html',
  styleUrls: ['./rsquestionnaire.component.scss']
})
export class RsquestionnaireComponent {
  questions: any[] = [];
  responses: { [key: number]: string } = {};
  recommendations: any[] = [];

  constructor(private rsService: RsControllerService, private router: Router) {
    rsService.getQuestions().subscribe(
      (data) => {
        this.questions = data as any[];
      },
      (error) => {
        console.error("Error fetching questions");
      }
    );
  }

  handleResponse(event: { id: number; value: string }) {
    this.responses[event.id] = event.value;
  }

  // Method to check if all questions are answered
  isSubmitEnabled(): boolean {
    return this.questions.length > 0 && this.questions.every(q => this.responses[q.id]);
  }

  submitResponses() {
    this.rsService.getTop3({ body: this.responses }).subscribe(
      (data) => {
        this.recommendations = data;
        console.log(this.recommendations);
  
        // Navigate to new page with recommendations
        this.router.navigate(['/rsgrouprecommendation'], { 
          queryParams: { data: JSON.stringify(this.recommendations) } 
        });
      },
      (error) => {
        console.error('Error fetching recommendations', error);
      }
    );
  }
}