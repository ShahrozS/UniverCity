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


    // Comparison helper methods
  getBetterRankedUniversity(): string {
    return this.university1?.rank < this.university2?.rank ? this.university1?.name : this.university2?.name;
  }

  getRankDifference(): number {
    return Math.abs((this.university1?.rank || 0) - (this.university2?.rank || 0));
  }

  getCheaperUniversity(): string {
    return this.university1?.averageFees < this.university2?.averageFees ? this.university1?.name : this.university2?.name;
  }

  getFeesDifference(): number {
    return Math.abs((this.university1?.averageFees || 0) - (this.university2?.averageFees || 0));
  }

  getEarlierApplicationDate(): string {
    const date1 = new Date(this.university1?.applyDate);
    const date2 = new Date(this.university2?.applyDate);
    return date1 < date2 ? this.university1?.name : this.university2?.name;
  }
}
