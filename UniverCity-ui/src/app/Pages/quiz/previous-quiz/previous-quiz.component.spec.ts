import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PreviousQuizComponent } from './previous-quiz.component';

describe('PreviousQuizComponent', () => {
  let component: PreviousQuizComponent;
  let fixture: ComponentFixture<PreviousQuizComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [PreviousQuizComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PreviousQuizComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
