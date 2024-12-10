import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-compare-universities',
  templateUrl: './compare-universities.component.html',
  styleUrl: './compare-universities.component.scss'
})
export class CompareUniversitiesComponent implements OnInit{
  university1: any;
  university2: any;
  
  constructor(private route: ActivatedRoute){
  
  }
  
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.university1 = JSON.parse(params['university1']);
      this.university2 = JSON.parse(params['university2']);
    })
  }
}
