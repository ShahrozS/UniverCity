import { FavoriteUniversitiesComponent } from './Pages/favorite-universities/favorite-universities.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from './Pages/login/login.component';
import {RegisterComponent} from './Pages/register/register.component';
import {ActivateAccountComponent} from './Pages/activate-account/activate-account.component';
import { AboutComponent } from './Pages/about/about.component';
import { UniversityByProgramListComponent } from './Pages/university-by-program-list/university-by-program-list.component';
import { CompareUniversityComponent } from './Pages/compare-university/compare-university.component';

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
    {path: 'about', component: AboutComponent},
    {path: 'compare-university', component: CompareUniversityComponent},
    {path: 'university-by-program-list', component: UniversityByProgramListComponent},
    {path: 'university-by-program-list/:program', component: UniversityByProgramListComponent},
    {path: 'favorite-university', component: FavoriteUniversitiesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
