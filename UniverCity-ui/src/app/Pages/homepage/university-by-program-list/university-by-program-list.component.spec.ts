import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UniversityByProgramListComponent } from './university-by-program-list.component';

describe('UniversityByProgramListComponent', () => {
  let component: UniversityByProgramListComponent;
  let fixture: ComponentFixture<UniversityByProgramListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [UniversityByProgramListComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(UniversityByProgramListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
