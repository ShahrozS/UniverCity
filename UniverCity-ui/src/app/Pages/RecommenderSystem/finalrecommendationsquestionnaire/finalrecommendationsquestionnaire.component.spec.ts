import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FinalrecommendationsquestionnaireComponent } from './finalrecommendationsquestionnaire.component';

describe('FinalrecommendationsquestionnaireComponent', () => {
  let component: FinalrecommendationsquestionnaireComponent;
  let fixture: ComponentFixture<FinalrecommendationsquestionnaireComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FinalrecommendationsquestionnaireComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FinalrecommendationsquestionnaireComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
