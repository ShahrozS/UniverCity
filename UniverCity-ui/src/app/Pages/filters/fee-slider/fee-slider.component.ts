import { Component, EventEmitter, Output } from '@angular/core';
import { SliderModule } from 'primeng/slider';

@Component({
  selector: 'app-fee-slider',
  templateUrl: './fee-slider.component.html',
  styleUrls: ['./fee-slider.component.scss']
})
export class FeeSliderComponent {
  rangeValues: number[] = [20000, 300000];

  // Timeout reference for debouncing
  private sliderChangeTimeout: any;

  // Emit the updated values to the parent component
  @Output() rangeChanged = new EventEmitter<number[]>();

  // Handle changes from inputs
  onRangeChange(): void {
    if (this.rangeValues[0] < 20000) {
      this.rangeValues[0] = 20000; // Ensure min boundary
    }
    if (this.rangeValues[1] > 300000) {
      this.rangeValues[1] = 300000; // Ensure max boundary
    }
    if (this.rangeValues[0] > this.rangeValues[1]) {
      this.rangeValues[0] = this.rangeValues[1] - 1; // Prevent overlap
    }

    // Emit updated values immediately after input change
    this.emitRangeValues();
  }

  // Handle changes from the slider with debouncing
  onSliderChange(): void {
    console.log('Slider updated:', this.rangeValues);
    
    // Clear the previous timeout if it exists
    if (this.sliderChangeTimeout) {
      clearTimeout(this.sliderChangeTimeout);
    }

    // Set a new timeout to emit the value after 300ms
    this.sliderChangeTimeout = setTimeout(() => {
      this.emitRangeValues(); // Emit updated values after 300ms delay
    }, 300);
  }

  // Emit the updated values to the parent
  private emitRangeValues(): void {
    this.rangeChanged.emit(this.rangeValues);
    console.log('Emitted range values:', this.rangeValues);
  }
}
