import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SelectionServiceTsService {
  private storageKey = 'mockTestSelections';

  constructor() {
    this.loadFromStorage();
  }

  private mode?: string = '';
  private time?: string = '';
  private questionCount?: number = 0;
  private difficulty?: number = 0;
  private category?: number = 0;
  private subcategory?: number = 0;
  private categoryName?:string=  '';
  private score?:number= 0;

  // 🔄 Load stored values from localStorage
  private loadFromStorage() {
    const storedData = localStorage.getItem(this.storageKey);
    if (storedData) {
      const parsedData = JSON.parse(storedData);
      this.mode = parsedData.mode || '';
      this.time = parsedData.time || '';
      this.questionCount = parsedData.questionCount || 0;
      this.difficulty = parsedData.difficulty || 0;
      this.category = parsedData.category || 0;
      this.subcategory = parsedData.subcategory || 0;
      this.categoryName = parsedData.categoryName || 0;
    }
  }

  // 🔄 Save values to localStorage
  private saveToStorage() {
    const data = {
      mode: this.mode,
      time: this.time,
      questionCount: this.questionCount,
      difficulty: this.difficulty,
      category: this.category,
      subcategory: this.subcategory,
      categoryName :this.categoryName,
      score:this.score
    };
    localStorage.setItem(this.storageKey, JSON.stringify(data));
  }

  setMode(selectedMode: string) {
    this.mode = selectedMode;
    this.saveToStorage();
  }

  getMode(): string | undefined {
    return this.mode;
  }

  setTime(selectedTime: string | undefined) {
    this.time = selectedTime;
    this.saveToStorage();
  }

  getTime(): string | undefined {
    return this.time;
  }

  setQuestionCount(selectedQuestionCount: string | undefined) {
    this.questionCount = Number(selectedQuestionCount);
    this.saveToStorage();
  }

  getQuestionCount(): number | undefined {
    return this.questionCount;
  }

  setDifficulty(selectedDifficulty: string | undefined) {
    if (selectedDifficulty === "Easy") {
      this.difficulty = 1;
    } else if (selectedDifficulty === "Medium") {
      this.difficulty = 2;
    } else if (selectedDifficulty === "Hard") {
      this.difficulty = 3;
    }
    this.saveToStorage();
  }

  getDifficulty(): number | undefined {
    return this.difficulty;
  }

  setCategory(category: number | undefined) {
    this.category = category;
    this.saveToStorage();
  }

  getCategory(): number | undefined {
    return this.category;
  }

  setSubCategory(subcategory: number | undefined) {
    this.subcategory = subcategory;
    this.saveToStorage();
  }

  getSubCategory(): number | undefined {
    return this.subcategory;
  }

  setCategoryName(categoryName:string | undefined){
    this.categoryName = categoryName;
    this.saveToStorage();
  }
  getCategoryName():string | undefined{
    return this.categoryName;
  } 
  setScore(score:number|undefined){
    this.score = score;
    this.saveToStorage();
  }
  getScore():number|undefined{
    return this.category;
  }


  // private quizResults: { subCategory: string, correct: number, total: number }[] = [];

  // setQuizResults(results: { subCategory: string, correct: number, total: number }[]) {
  //   this.quizResults = results;

  // }

  // getQuizResults() {

  //   return this.quizResults;
  // }


  private quizResultsSubject = new BehaviorSubject<{ subCategory: string, correct: number, total: number }[]>([]);
  quizResults$ = this.quizResultsSubject.asObservable();


  setQuizResults(results: { subCategory: string, correct: number, total: number }[]) {
    this.quizResultsSubject.next(results);
  }

  getQuizResults() {
    return this.quizResultsSubject.getValue();
  }

}
