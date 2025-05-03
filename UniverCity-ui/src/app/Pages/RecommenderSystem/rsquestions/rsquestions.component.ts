import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-rsquestions',
  templateUrl: './rsquestions.component.html',
  styleUrls: ['./rsquestions.component.scss']
})
export class RsquestionsComponent {
  @Input() question: string = ''; // Receive the question from parent
  @Input() questionId: number = 0; // Question ID for form binding
  @Output() responseChange = new EventEmitter<{ id: number; value: string }>();

  selectedValue: string = '';

  likertOptions = [
    { label: "Highly Disagree", value: "highly_disagree", size: "w-14 h-14", bgColor: "bg-red-300", activeColor: "bg-red-500 border-red-700" },
    { label: "Disagree", value: "disagree", size: "w-12 h-12", bgColor: "bg-orange-300", activeColor: "bg-orange-500 border-orange-700" },
    { label: "Neutral", value: "neutral", size: "w-10 h-10", bgColor: "bg-gray-300", activeColor: "bg-gray-500 border-gray-700" },
    { label: "Agree", value: "agree", size: "w-12 h-12", bgColor: "bg-green-300", activeColor: "bg-green-500 border-green-700" },
    { label: "Highly Agree", value: "highly_agree", size: "w-14 h-14", bgColor: "bg-green-500", activeColor: "bg-green-700 border-green-900" }
  ];

  onSelectionChange(value: string) {
    this.selectedValue = value;
    this.responseChange.emit({ id: this.questionId, value });
  }
}