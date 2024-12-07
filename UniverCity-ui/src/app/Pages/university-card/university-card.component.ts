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
  @Output() favoriteToggled = new EventEmitter<any>();

  isSelected = false;
  isFavorited = false;

  toggleSelection() {
    this.isSelected = !this.isSelected;
    this.selectionChanged.emit({ university: this.university, isSelected: this.isSelected });
  }

  toggleFavorite() {
    this.isFavorited = !this.isFavorited;
    this.favoriteToggled.emit({ university: this.university, isFavorited: this.isFavorited });
    //add service request to add uni or remove uni from favourites
    if(this.isFavorited){
      //post response
    }else{
      //delete response
    }
  }
}
