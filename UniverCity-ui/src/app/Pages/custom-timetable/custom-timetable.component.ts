import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { University } from '../../Services/models';
import { FavouritesService } from '../../Services/services';
export interface UniversityEvent {
  university: University;
  eventType: string;
}

interface CalendarDay {
  date: Date;
  isCurrentMonth: boolean;
  events: UniversityEvent[];
}
@Component({
  selector: 'app-custom-timetable',
  templateUrl: './custom-timetable.component.html',
  styleUrls: ['./custom-timetable.component.scss']
})
export class CustomTimetableComponent implements OnInit {
  favoriteUniversities: University[] = [];
  currentDate = new Date();
  currentMonth: number;
  currentYear: number;
  daysInMonth: Array<{
    date: Date;
    isCurrentMonth: boolean;
    events: UniversityEvent[];
  }> = [];
  selectedEvent: UniversityEvent | null = null;
  monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 
                'July', 'August', 'September', 'October', 'November', 'December'];
  dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  loading = true;
  error = false;
 
  constructor(private favoriteService: FavouritesService,
              private cdRef: ChangeDetectorRef
    
  ) {
    this.currentMonth = this.currentDate.getMonth();
    this.currentYear = this.currentDate.getFullYear();
    
  }

  ngOnInit(): void {
    this.loadFavoriteUniversities();
  }

  loadFavoriteUniversities(): void {
    this.loading = true;
    this.favoriteService.getFavorites()
      .subscribe({
        next: (universities) => {
          this.favoriteUniversities = universities;
          this.generateCalendarDays();
          this.loading = false;
        },
        error: (err) => {
          console.error('Error loading favorite universities', err);
          this.error = true;
          this.loading = false;
        }
      });
  }

  generateCalendarDays(): void {
    this.daysInMonth = [];
    
    // Get the first day of the month
    const firstDay = new Date(this.currentYear, this.currentMonth, 1);
    const lastDay = new Date(this.currentYear, this.currentMonth + 1, 0);
    
    // Fill in the days from the previous month
    for (let i = 0; i < firstDay.getDay(); i++) {
      const prevMonthDate = new Date(this.currentYear, this.currentMonth, -i);
      this.daysInMonth.unshift({
        date: prevMonthDate,
        isCurrentMonth: false,
        events: this.getEventsForDate(prevMonthDate)
      });
    }
    
    // Fill in the days of the current month
    for (let i = 1; i <= lastDay.getDate(); i++) {
      const date = new Date(this.currentYear, this.currentMonth, i);
      this.daysInMonth.push({
        date,
        isCurrentMonth: true,
        events: this.getEventsForDate(date)
      });
    }
    
    // Fill in the remaining days from the next month to complete the grid
    const remainingDays = 42 - this.daysInMonth.length; // 6 rows of 7 days
    for (let i = 1; i <= remainingDays; i++) {
      const date = new Date(this.currentYear, this.currentMonth + 1, i);
      this.daysInMonth.push({
        date,
        isCurrentMonth: false,
        events: this.getEventsForDate(date)
      });
    }
  }

  getEventsForDate(date: Date): UniversityEvent[] {
    const events: UniversityEvent[] = [];
    
    this.favoriteUniversities.forEach(university => {
      // Check for application date
      if (university.applyDate && this.isSameDay(new Date(university.applyDate), date)) {
        events.push({university, eventType: 'application'});
      }
      
      // Check for entry test date
      if (university.entryTestDate && this.isSameDay(new Date(university.entryTestDate), date)) {
        events.push({university, eventType: 'entryTest'});
      }
      
      // Check for start date
      if (university.startDate && this.isSameDay(new Date(university.startDate), date)) {
        events.push({university, eventType: 'startDate'});
      }
    });
    
    return events;
  }

  isSameDay(date1: Date, date2: Date): boolean {
    return date1.getDate() === date2.getDate() && 
           date1.getMonth() === date2.getMonth() && 
           date1.getFullYear() === date2.getFullYear();
  }

  prevMonth(): void {
    if (this.currentMonth === 0) {
      this.currentMonth = 11;
      this.currentYear--;
    } else {
      this.currentMonth--;
    }
    this.generateCalendarDays();
  }

  nextMonth(): void {
    if (this.currentMonth === 11) {
      this.currentMonth = 0;
      this.currentYear++;
    } else {
      this.currentMonth++;
    }
    this.generateCalendarDays();
  }

  viewEvent(event: UniversityEvent): void {
    this.selectedEvent = event;
  }

  closeEventDetail(): void {
    this.selectedEvent = null;
  }
  
  getEventTypeLabel(eventType: string): string {
    switch(eventType) {
      case 'application':
        return 'Application Deadline';
      case 'startDate':
        return 'Start Date';
      case 'entryTest':
        return 'Entry Test';
      default:
        return 'Event';
    }
  }
  
  getEventColor(eventType: string): string {
    switch(eventType) {
      case 'application':
        return '#FF5733'; // Bright orange-red
      case 'startDate':
        return '#33FF57'; // Bright green
      case 'entryTest':
        return '#3357FF'; // Bright blue
      default:
        return '#FFCC33'; // Default gold
    }
  }

  getMonthShort(event: UniversityEvent): string {
    const date = this.getEventDate(event);
    if (!date) return '';
    return this.monthNames[date.getMonth()].substring(0, 3);
  }
  /**
   * Returns the day number for an event date
   */
  getEventDay(event: UniversityEvent): number {
    const date = this.getEventDate(event);
    if (!date) return 0;
    return date.getDate();
  }
  
  /**
   * Formats an event date in a readable format
   */
  formatEventDate(event: UniversityEvent): string {
    const date = this.getEventDate(event);
    if (!date) return 'N/A';
    
    const options: Intl.DateTimeFormatOptions = {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    };
    
    return date.toLocaleDateString('en-US', options);
  }
  
  /**
   * Returns the specific date associated with an event type
   */
  getEventDate(event: UniversityEvent): Date | null {
    if (!event || !event.university) return null;
    
    switch(event.eventType) {
      case 'application':
        return event.university.applyDate ? new Date(event.university.applyDate) : null;
      case 'entryTest':
        return event.university.entryTestDate ? new Date(event.university.entryTestDate) : null;
      case 'startDate':
        return event.university.startDate ? new Date(event.university.startDate) : null;
      default:
        return null;
    }
  }

  /**
   * Returns the number of days remaining until an event
   */
  getDaysRemaining(event: UniversityEvent): number {
    const eventDate = this.getEventDate(event);
    if (!eventDate) return 0;
    
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    const diffTime = eventDate.getTime() - today.getTime();
    if (diffTime <= 0) return 0;
    
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays;
  }

  /**
   * Formats a date in a readable format
   */
  formatDate(date: Date | string | undefined): string {
    if (!date) return 'N/A';
    
    const dateObj = typeof date === 'string' ? new Date(date) : date;
    
    const options: Intl.DateTimeFormatOptions = {
      year: 'numeric',
      month: 'short',
      day: 'numeric'
    };
    
    return dateObj.toLocaleDateString('en-US', options);
  }

  removeFavorite(universityId: number): void {
    this.favoriteService.removeFavorite({ universityId }).subscribe(
      () => {
        // ✅ Update the list to remove the clicked university
        this.favoriteUniversities = this.favoriteUniversities.filter(
          university => university.id !== universityId
        );
  
        this.closeEventDetail();
        this.loadFavoriteUniversities();
        // ✅ Force UI refresh
        this.cdRef.detectChanges();
      },
      (error) => {
        console.error('Error removing university from favorites', error);
      }
    );
  }
  
  
}
