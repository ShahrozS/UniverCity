import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SelectionServiceTsService {
  private mode?: string = '';
  private time?: string = '';
  private questionCount?: string = '';
  private difficulty?: string = '';
  private category ?:number=0;
  private subcategory?: number=0;

  setMode(selectedMode: string) {
    this.mode = selectedMode;
  }

  getMode(): string|undefined {
    return this.mode;
  }

  setTime(selectedTime: string|undefined){
      this.time = selectedTime;
  }
  getTime():string|undefined{
    return this.time;
  }
  setQuestionCount(selectedQuestionCount: string|undefined){
    this.questionCount = selectedQuestionCount;
  }
  getQuestionCount():string|undefined{
    return this.questionCount;
  }
  setDifficulty(selectedDifficulty:string|undefined){
    this.difficulty = selectedDifficulty;
  }
  getDifficulty():string|undefined{
    return this.difficulty;
  }

  getCategory():number|undefined{
    return this.category;
  }
  setCategory(category:number|undefined ){
    this.category = category;
  }

  getSubCategory():number|undefined{
    return this.subcategory;
  }
  setSubCategory(subcategory:number|undefined){
    this.subcategory = subcategory;
  }

}
