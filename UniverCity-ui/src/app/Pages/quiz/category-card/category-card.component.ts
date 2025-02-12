import { Component, Input } from '@angular/core';
import { QuizCategory } from '../../../Services/models';
import { Router } from '@angular/router';
import { SelectionServiceTsService } from '../selection.service.ts.service';

@Component({
  selector: 'app-category-card',
  templateUrl: './category-card.component.html',
  styleUrl: './category-card.component.scss'
})
export class CategoryCardComponent {
  @Input() category!: QuizCategory;

    constructor(private router:Router, private service: SelectionServiceTsService) {}
  

  clickOnCategory(){
    this.router.navigate(["quiz-options"]);
    this.service.setCategory(this.category.quizcategory_id);
  }



}
