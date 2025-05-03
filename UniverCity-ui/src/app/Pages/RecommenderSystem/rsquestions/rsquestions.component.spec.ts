import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RsquestionsComponent } from './rsquestions.component';

describe('RsquestionsComponent', () => {
  let component: RsquestionsComponent;
  let fixture: ComponentFixture<RsquestionsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [RsquestionsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RsquestionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
