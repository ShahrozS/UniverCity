import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';

@Component({
  selector: 'app-compare-universities',
  templateUrl: './compare-universities.component.html',
  styleUrl: './compare-universities.component.scss'
})
export class CompareUniversitiesComponent implements OnInit{
  university1: any;
  university2: any;

  constructor(private route: ActivatedRoute, private router: Router){

  }

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.university1 = JSON.parse(params['university1']);
      this.university2 = JSON.parse(params['university2']);
    })
  }

  openUniversity(university: any) {
    this.router.navigate(['/university-details'], {
      queryParams: {
        university: JSON.stringify(university)
      }
    });
  }
}
