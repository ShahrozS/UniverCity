import { Component } from '@angular/core';
import { SliderModule } from 'primeng/slider';

@Component({
  selector: 'app-fee-slider',
  templateUrl: './fee-slider.component.html',
  styleUrl: './fee-slider.component.scss'
})
export class FeeSliderComponent {
  rangeValues: number[] = [20000, 20000000]
}
