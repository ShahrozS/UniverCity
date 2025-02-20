import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SelectionServiceTsService {
  private storageKey = 'mockTestSelections';

  constructor() { this.loadFromStorage(); }

  private mode: string = '';
  private time: string = '';
  private questionCount: number = 0;
  private difficulty: number = 0;
  private category: number = 0;
  private subcategory: number = 0;
  private categoryName: string = '';
  private score: number = 0;

  public loadFromStorage() {
    const storedData = localStorage.getItem(this.storageKey);
    if (storedData) {
      const parsedData = JSON.parse(storedData);
      this.mode = parsedData.mode || '';
      this.time = parsedData.time || '';
      this.questionCount = parsedData.questionCount || 0;
      this.difficulty = parsedData.difficulty || 0;
      this.category = parsedData.category || 0;
      this.subcategory = parsedData.subcategory || 0;
      this.categoryName = parsedData.categoryName || '';
      this.score = parsedData.score || 0;
    }
  }

  private saveToStorage() {
    localStorage.setItem(this.storageKey, JSON.stringify({
      mode: this.mode,
      time: this.time,
      questionCount: this.questionCount,
      difficulty: this.difficulty,
      category: this.category,
      subcategory: this.subcategory,
      categoryName: this.categoryName,
      score: this.score
    }));
  }

  setMode(selectedMode: string) { 
    this.mode = selectedMode; 
    this.saveToStorage(); 
  }
  getMode(): string { return this.mode; }

  setTime(selectedTime: string) { 
    this.time = selectedTime; 
    this.saveToStorage(); 
  }
  getTime(): string { return this.time; }

  setQuestionCount(selectedQuestionCount: string) { 
    this.questionCount = Number(selectedQuestionCount); 
    this.saveToStorage(); 
  }
  getQuestionCount(): number { return this.questionCount; }

  setDifficulty(selectedDifficulty: string) {
    switch(selectedDifficulty) { // 🟢 Handled all cases explicitly
      case 'Easy': this.difficulty = 1; break;
      case 'Medium': this.difficulty = 2; break;
      case 'Hard': this.difficulty = 3; break;
      default: this.difficulty = 0;
    }
    this.saveToStorage();
  }
  getDifficulty(): number { return this.difficulty; }

  setCategory(category: number) { 
    this.category = category; 
    this.saveToStorage(); 
  }
  getCategory(): number { return this.category; }

  setSubCategory(subcategory: number) { 
    this.subcategory = subcategory; 
    this.saveToStorage(); 
  }
  getSubCategory(): number { return this.subcategory; }

  setCategoryName(categoryName: string) { 
    this.categoryName = categoryName; 
    this.saveToStorage(); 
  }
  getCategoryName(): string { return this.categoryName; }

  setScore(score: number) { 
    this.score = score; 
    this.saveToStorage(); 
  }
  getScore(): number { return this.score; }

  // Quiz Results Handling
  private quizResultsSubject = new BehaviorSubject<{ subCategory: string, correct: number, total: number }[]>([]);
  quizResults$ = this.quizResultsSubject.asObservable();
  setQuizResults(results: { subCategory: string, correct: number, total: number }[]) {
    this.quizResultsSubject.next(results);
  }
  getQuizResults() { return this.quizResultsSubject.getValue(); }
}