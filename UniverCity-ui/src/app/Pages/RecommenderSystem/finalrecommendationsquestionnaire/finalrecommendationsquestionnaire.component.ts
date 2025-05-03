import { Component } from '@angular/core';
import { ActivatedRoute, Router} from '@angular/router';
import { Location } from '@angular/common';
import { RsControllerService } from '../../../Services/services';


@Component({
  selector: 'app-finalrecommendationsquestionnaire',
  templateUrl: './finalrecommendationsquestionnaire.component.html',
  styleUrls: ['./finalrecommendationsquestionnaire.component.scss']
})
export class FinalrecommendationsquestionnaireComponent {
  questions: any[] = [];
  responses: { [key: number]: string } = {};
  recommendations: any[] = [];
  selectedProgram: any;

  constructor(
    private rsService: RsControllerService,
    private router: Router,
    private route: ActivatedRoute,
    private location: Location
  ) {
    const data = this.route.snapshot.queryParamMap.get('data');
    if (data) {
      this.selectedProgram = JSON.parse(data);
      let tempObject = {
        rscategoryid: this.selectedProgram.rscategoryid,
        rscategoryname: this.selectedProgram.rscategoryname
      };
      
      console.log(this.selectedProgram);
      
      rsService.getQuestionsByCategory({ body: tempObject }).subscribe(
        (data) => {
          this.questions = data as any[];
          console.log(this.questions);
        },
        (error) => {
          console.error("Error fetching questions");
        }
      );
    }
  }

  submitResponses() {
    this.rsService.getTop3Sub({body : this.responses}).subscribe(
      (data) => {
        this.recommendations = data;
      },
      (error) => {
        console.error('Error fetching recommendations', error);
      }
    );
  }

  handleResponse(event: { id: number; value: string }) {
    this.responses[event.id] = event.value;
  }

  isSubmitEnabled(): boolean {
    return this.questions.length > 0 && this.questions.every(q => this.responses[q.id]);
  }

  takeFurtherRecommendations(program: any) {
    if (program) {
      this.router.navigate(['/rsfinalrecommendationquestionnaire'], { 
        queryParams: { data: JSON.stringify(program) } 
      });
    }
  }

  goBack() {
    this.location.back();
  }
}