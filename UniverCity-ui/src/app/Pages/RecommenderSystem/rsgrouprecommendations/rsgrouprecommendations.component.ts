import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-rsgrouprecommendations',
  templateUrl: './rsgrouprecommendations.component.html',
  styleUrls: ['./rsgrouprecommendations.component.scss']
})
export class RsgrouprecommendationsComponent {
  recommendations: any[] = [];

  constructor(private route: ActivatedRoute, private router: Router) {
    // Receive data passed during navigation
    const data = this.route.snapshot.queryParamMap.get('data');
    if (data) {
      this.recommendations = JSON.parse(data);
      console.log(this.recommendations);
    }
  }

  takeFurtherRecommendations(program: any) {
    if (program) {
      console.log(program);
      this.router.navigate(['/rsfinalrecommendationquestionnaire'], { 
        queryParams: { data: JSON.stringify(program)} 
      });
    }
  }
}