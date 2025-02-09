import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { SliderModule } from 'primeng/slider';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {HTTP_INTERCEPTORS, HttpClient, HttpClientModule} from "@angular/common/http";
import { LoginComponent } from './Pages/login/login.component';
import {FormsModule} from '@angular/forms';
import {CodeInputModule} from 'angular-code-input';
import {ActivateAccountComponent} from './Pages/activate-account/activate-account.component';
import {RegisterComponent} from './Pages/register/register.component';
import { HomeComponent } from './Pages/home/home.component';
import { NavbarComponent } from './Pages/navbar/navbar.component';
import { SearchbarComponent } from './Pages/searchbar/searchbar.component';
import {FeeSliderComponent} from './Pages/filters/fee-slider/fee-slider.component';
import {FiltersComponent} from './Pages/filters/filters.component';
import {Button} from 'primeng/button';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { AuthInterceptor } from './auth.interceptor';
import { UniversityByProgramListComponent } from "./Pages/university-by-program-list/university-by-program-list.component";
import { UniversityListComponent } from './Pages/university-list/university-list.component';
import { UniversityCardsComponent } from './Pages/university-cards/university-cards.component';
import { CompareUniversitiesComponent } from './Pages/compare-universities/compare-universities.component';
import { UniversityDetailsComponent } from './Pages/university-details/university-details.component';
import { MockTestComponent } from './Pages/quiz/mock-test/mock-test.component';
import { QuizCategoryComponent } from './Pages/quiz/quiz-category/quiz-category.component';
import { CategoryListComponent } from './Pages/quiz/category-list/category-list.component';
import { CategoryCardComponent } from './Pages/quiz/category-card/category-card.component';
import { QuizOptionsComponent } from './Pages/quiz/quiz-options/quiz-options.component';
import { OptionCardComponent } from './Pages/quiz/option-card/option-card.component';
import { ReactiveFormsModule } from '@angular/forms';
import { QuizResultComponent } from './pages/quiz/quiz-result/quiz-result.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    ActivateAccountComponent,
    HomeComponent,
    NavbarComponent,
    SearchbarComponent,
    FiltersComponent,
    FeeSliderComponent,
    UniversityListComponent,
    UniversityCardsComponent,
    CompareUniversitiesComponent,
    UniversityDetailsComponent,
    MockTestComponent,
    QuizCategoryComponent,
    CategoryListComponent,
    CategoryCardComponent,
    QuizOptionsComponent,
    OptionCardComponent,
    QuizResultComponent,

  ],
  imports: [
    ReactiveFormsModule,
    BrowserModule,
    FontAwesomeModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    CodeInputModule,
    SliderModule,
    BrowserAnimationsModule,
    Button,
    UniversityByProgramListComponent,
],
  providers: [
    HttpClient,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true, // Ensures this interceptor is part of the chain
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
