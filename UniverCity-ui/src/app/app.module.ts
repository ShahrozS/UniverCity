import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { SliderModule } from 'primeng/slider';

import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {HttpClient, HttpClientModule} from "@angular/common/http";
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

  ],
  imports: [
    BrowserModule,
    FontAwesomeModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    CodeInputModule,
    SliderModule,
    BrowserAnimationsModule,
    Button
  ],
  providers: [
    HttpClient
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
