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
import {authGuard} from './Services/guard/auth.guard';
import { QuizCategoryComponent } from './Pages/quiz/quiz-category/quiz-category.component';
import { MockTestComponent } from './Pages/quiz/mock-test/mock-test.component';
import { QuizOptionsComponent } from './Pages/quiz/quiz-options/quiz-options.component';
import { QuizResultComponent } from './Pages/quiz/quiz-result/quiz-result.component';
import { PreviousQuizComponent } from './Pages/quiz/previous-quiz/previous-quiz.component';
import { FavoritedUniversitiesComponent } from './Pages/favorited-universities/favorited-universities.component';
import { UserProfileComponent } from './Pages/user-profile/user-profile.component';

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
    component: HomeComponent,
    canActivate:[authGuard]
  },
    {path: 'about', component: AboutComponent,
      canActivate:[authGuard]},
    {path: 'compare-universities', component: CompareUniversitiesComponent,
      canActivate:[authGuard]},
    {path: 'university-list', component: UniversityListComponent,
      canActivate:[authGuard]},
    {path: 'university-details', component: UniversityDetailsComponent,
      canActivate:[authGuard]},
    {path: 'quiz-category', component: QuizCategoryComponent,
      canActivate:[authGuard]},
      {path: 'mock-test', component: MockTestComponent,
        canActivate:[authGuard]},
        {path: 'quiz-options', component: QuizOptionsComponent,
          canActivate:[authGuard]},
          {path: 'quiz-result', component: QuizResultComponent,
            canActivate:[authGuard] // Forces component reload on route change
          },
            {path: 'previous-quiz', component: PreviousQuizComponent,
              canActivate:[authGuard]},
            {path: 'favourite-universities', component: FavoritedUniversitiesComponent,
              canActivate:[authGuard]},
              {path: 'user-profile', component: UserProfileComponent,
                canActivate:[authGuard]},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
