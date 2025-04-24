import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomTimetableComponent } from './custom-timetable.component';

describe('CustomTimetableComponent', () => {
  let component: CustomTimetableComponent;
  let fixture: ComponentFixture<CustomTimetableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CustomTimetableComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CustomTimetableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
