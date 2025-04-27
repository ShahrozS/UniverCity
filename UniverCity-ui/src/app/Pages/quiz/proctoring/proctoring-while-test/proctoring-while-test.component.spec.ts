import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProctoringWhileTestComponent } from './proctoring-while-test.component';

describe('ProctoringWhileTestComponent', () => {
  let component: ProctoringWhileTestComponent;
  let fixture: ComponentFixture<ProctoringWhileTestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ProctoringWhileTestComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProctoringWhileTestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
