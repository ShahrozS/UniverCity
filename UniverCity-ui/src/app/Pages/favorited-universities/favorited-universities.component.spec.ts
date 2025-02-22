import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavoritedUniversitiesComponent } from './favorited-universities.component';

describe('FavoritedUniversitiesComponent', () => {
  let component: FavoritedUniversitiesComponent;
  let fixture: ComponentFixture<FavoritedUniversitiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FavoritedUniversitiesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FavoritedUniversitiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
