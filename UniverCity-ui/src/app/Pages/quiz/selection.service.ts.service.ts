import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SelectionServiceTsService {
  private mode: string = '';
  private time: string = '';
  private questionCount: string = '';
  private difficulty: string = '';

  setMode(selectedMode: string) {
    this.mode = selectedMode;
  }

  getMode(): string {
    return this.mode;
  }

  setTime(selectedTime: string){
      this.time = selectedTime;
  }
  getTime():string{
    return this.time;
  }
  setQuestionCount(selectedQuestionCount: string){
    this.questionCount = selectedQuestionCount;
  }
  getQuestionCount():string{
    return this.questionCount;
  }
  setDifficulty(selectedDifficulty:string){
    this.difficulty = selectedDifficulty;
  }
  getDifficulty():string{
    return this.difficulty;
  }

}
