import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RsquestionnaireComponent } from './rsquestionnaire.component';

describe('RsquestionnaireComponent', () => {
  let component: RsquestionnaireComponent;
  let fixture: ComponentFixture<RsquestionnaireComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [RsquestionnaireComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RsquestionnaireComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
