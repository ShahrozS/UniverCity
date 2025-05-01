import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UniversityCardsComponent } from './university-cards.component';

describe('UniversityCardsComponent', () => {
  let component: UniversityCardsComponent;
  let fixture: ComponentFixture<UniversityCardsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [UniversityCardsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UniversityCardsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
