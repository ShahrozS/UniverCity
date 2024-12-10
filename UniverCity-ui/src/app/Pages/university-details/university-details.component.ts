import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-university-details',
  templateUrl: './university-details.component.html',
  styleUrl: './university-details.component.scss'
})
export class UniversityDetailsComponent implements OnInit {
  university: any;
  
  constructor(private route: ActivatedRoute){
  
  }
  
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.university = JSON.parse(params['university']);
      console.log(this.university);
    })
  }
}
