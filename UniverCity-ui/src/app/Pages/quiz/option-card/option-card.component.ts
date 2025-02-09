import { Component, EventEmitter, Input, Output } from '@angular/core';
import { SelectionServiceTsService } from '../selection.service.ts.service';
import { faArrowLeft } from '@fortawesome/free-solid-svg-icons';
import { Router } from '@angular/router';

@Component({
  selector: 'app-option-card',
  templateUrl: './option-card.component.html',
  styleUrls: ['./option-card.component.scss']
})
export class OptionCardComponent {
  @Input() title: string = '';
  @Input() options: string[] = [];
  selectedOption: string = '';
  faArrowLeft  = faArrowLeft;
  constructor(private selectionService: SelectionServiceTsService,
            
  ) {}

  
  @Output() optionSelected = new EventEmitter<string>();


  
  selectOption(option: string) {
    this.selectedOption = option;

    if (this.title === 'Mode') {
      this.selectionService.setMode(option);
    }

    this.optionSelected.emit(option);

  }

  isSelected(option: string): boolean {
    return this.selectedOption === option;
  }

  Click(){
    this.selectionService.setMode('Untimed');
  }
}
