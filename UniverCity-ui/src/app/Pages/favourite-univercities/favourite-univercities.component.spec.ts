import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FavouriteUnivercitiesComponent } from './favourite-univercities.component';

describe('FavouriteUnivercitiesComponent', () => {
  let component: FavouriteUnivercitiesComponent;
  let fixture: ComponentFixture<FavouriteUnivercitiesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FavouriteUnivercitiesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FavouriteUnivercitiesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
