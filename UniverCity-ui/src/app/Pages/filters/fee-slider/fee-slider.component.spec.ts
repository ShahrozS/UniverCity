import { ComponentFixture, TestBed } from '@angular/core/testing';
import {FeeSliderComponent} from './fee-slider.component';


describe('FeeSliderComponent', () => {
  let component: FeeSliderComponent;
  let fixture: ComponentFixture<FeeSliderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FeeSliderComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FeeSliderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
