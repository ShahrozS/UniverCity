import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-university-card',
  standalone: true,
  imports: [],
  templateUrl: './university-card.component.html',
  styleUrl: './university-card.component.css'
})
export class UniversityCardComponent {
@Input() university: any;

@Output() selectionChanged = new EventEmitter<any>();
  isSelected = false;

  toggleSelection() {
    this.isSelected = !this.isSelected;
    this.selectionChanged.emit({ university: this.university, isSelected: this.isSelected });
  }
}
