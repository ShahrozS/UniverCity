import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompareUniversitiesComponent } from './compare-universities.component';

describe('CompareUniversitiesComponent', () => {
  let component: CompareUniversitiesComponent;
  let fixture: ComponentFixture<CompareUniversitiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CompareUniversitiesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CompareUniversitiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
