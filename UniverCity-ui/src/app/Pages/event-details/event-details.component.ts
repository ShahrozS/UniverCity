import { Component, Input, Output, EventEmitter } from '@angular/core';
import { University } from '../../Services/models';

@Component({
  selector: 'app-event-details',
  templateUrl: './event-details.component.html',
  styleUrls: ['./event-details.component.scss']
})
export class EventDetailsComponent {
  @Input() university!: University;
  @Input() eventType!: string;
  @Input() eventTypeLabel!: string;
  @Input() eventColor!: string;
  @Output() close = new EventEmitter<void>();

  closeDetail(): void {
    this.close.emit();
  }

  formatDate(date: string | null): string {
    if (!date) return 'Not specified';
    
    const options: Intl.DateTimeFormatOptions = { 
      weekday: 'long', 
      year: 'numeric', 
      month: 'long', 
      day: 'numeric' 
    };
    return new Date(date).toLocaleDateString(undefined, options);
  }
  
  getEventDate(): string | null {
    switch(this.eventType) {
      case 'application':
        return this.university.applyDate!;
      case 'entryTest':
        return this.university.entryTestDate!;
      case 'startDate':
        return this.university.startDate!;
      default:
        return null;
    }
  }
  
  getDaysRemaining(): number {
    const eventDate = this.getEventDate();
    if (!eventDate) return 0;
    
    const today = new Date();
    const timeDiff = new Date(eventDate).getTime() - today.getTime();
    return Math.ceil(timeDiff / (1000 * 3600 * 24));
  }
}
