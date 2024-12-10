import { CompareUniversitiesComponent } from './Pages/compare-universities/compare-universities.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from './Pages/login/login.component';
import {RegisterComponent} from './Pages/register/register.component';
import {ActivateAccountComponent} from './Pages/activate-account/activate-account.component';
import { AboutComponent } from './Pages/about/about.component';
import { UniversityListComponent } from './Pages/university-list/university-list.component';
import {HomeComponent} from './Pages/home/home.component';
import { UniversityDetailsComponent } from './Pages/university-details/university-details.component';

const routes: Routes = [
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'activate-account',
    component: ActivateAccountComponent
  },
  {
    path: 'home',
    component: HomeComponent
  },
    {path: 'about', component: AboutComponent},
    {path: 'compare-universities', component: CompareUniversitiesComponent},
    {path: 'university-list', component: UniversityListComponent},
    {path: 'university-details', component: UniversityDetailsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
