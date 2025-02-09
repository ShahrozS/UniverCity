import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

interface Question {
  id: number;
  text: string;
  options: string[];
  sectionId: number;
}

interface Section {
  id: number;
  title: string;
}

@Component({
  selector: 'app-mock-test',
  templateUrl: './mock-test.component.html',
  styleUrl: './mock-test.component.scss'
})
export class MockTestComponent {
  quizForm: FormGroup;
  timer: string = '00:00';
  startTime: number = 1800; // 30 minutes in seconds

  sections: Section[] = [
    { id: 1, title: 'Section 1: Basics' },
    { id: 2, title: 'Section 2: Advanced Concepts' },
    { id: 3, title: 'Section 3: Problem Solving' },
    { id: 4, title: 'Section 4: Implementation' }
  ];

  questions: Question[] = [
    // Section 1
    {
      id: 1,
      text: 'What is Angular?',
      options: ['Framework', 'Library', 'Programming Language', 'Database'],
      sectionId: 1
    },
    {
      id: 2,
      text: 'What is TypeScript?',
      options: ['Superset of JavaScript', 'Database', 'Browser', 'Operating System'],
      sectionId: 1
    },
    // Add more questions for other sections...
  ];

  constructor(private fb: FormBuilder) {
    this.quizForm = this.fb.group({});
    this.questions.forEach(q => {
      this.quizForm.addControl('question' + q.id, this.fb.control(''));
    });
  }

  ngOnInit() {
    this.startTimer();
  }

  startTimer() {
    const timer = setInterval(() => {
      if (this.startTime > 0) {
        this.startTime--;
        const minutes = Math.floor(this.startTime / 60);
        const seconds = this.startTime % 60;
        this.timer = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
      } else {
        clearInterval(timer);
        this.onSubmit();
      }
    }, 1000);
  }

  getQuestionsForSection(sectionId: number): Question[] {
    return this.questions.filter(q => q.sectionId === sectionId);
  }

  isOptionSelected(questionId: number, optionIndex: number): boolean {
    return this.quizForm.get('question' + questionId)?.value === optionIndex;
  }

  onOptionSelect(questionId: number, optionIndex: number) {
    this.quizForm.patchValue({ ['question' + questionId]: optionIndex });
  }

  onSubmit() {
    console.log(this.quizForm.value);
    // Handle form submission
  }
}
