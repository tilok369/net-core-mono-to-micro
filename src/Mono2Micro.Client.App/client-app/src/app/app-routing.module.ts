import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ClientManagementComponent } from './client-management/client-management.component';
import { ClientManagementAddComponent } from './client-management-add/client-management-add.component';
import { LoanManagementComponent } from './loan-management/loan-management.component';
import { TransactionManagementComponent } from './transaction-management/transaction-management.component';

const routes: Routes = [
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: 'client-management',
    component: ClientManagementComponent
  },
  {
    path: 'client-management-add',
    component: ClientManagementAddComponent
  },
  {
    path: 'loan-management',
    component: LoanManagementComponent
  },
  {
    path: 'transaction-management',
    component: TransactionManagementComponent
  },
  {
    path: '**',
    redirectTo: '/home',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
