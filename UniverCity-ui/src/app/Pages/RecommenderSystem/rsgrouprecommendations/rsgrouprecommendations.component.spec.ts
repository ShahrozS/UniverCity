import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RsgrouprecommendationsComponent } from './rsgrouprecommendations.component';

describe('RsgrouprecommendationsComponent', () => {
  let component: RsgrouprecommendationsComponent;
  let fixture: ComponentFixture<RsgrouprecommendationsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [RsgrouprecommendationsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RsgrouprecommendationsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
