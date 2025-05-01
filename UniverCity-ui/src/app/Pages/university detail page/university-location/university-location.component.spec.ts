import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UniversityLocationComponent } from './university-location.component';

describe('UniversityLocationComponent', () => {
  let component: UniversityLocationComponent;
  let fixture: ComponentFixture<UniversityLocationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [UniversityLocationComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UniversityLocationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
