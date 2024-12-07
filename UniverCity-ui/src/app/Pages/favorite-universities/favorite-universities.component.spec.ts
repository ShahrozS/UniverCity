import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavoriteUniversitiesComponent } from './favorite-universities.component';

describe('FavoriteUniversitiesComponent', () => {
  let component: FavoriteUniversitiesComponent;
  let fixture: ComponentFixture<FavoriteUniversitiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FavoriteUniversitiesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FavoriteUniversitiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
