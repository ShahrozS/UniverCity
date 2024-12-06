import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { UniversityCardComponent } from '../university-card/university-card.component';

@Component({
  selector: 'app-compare-university',
  standalone: true,
  imports: [UniversityCardComponent],
  templateUrl: './compare-university.component.html',
  styleUrl: './compare-university.component.css'
})
export class CompareUniversityComponent implements OnInit{
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
