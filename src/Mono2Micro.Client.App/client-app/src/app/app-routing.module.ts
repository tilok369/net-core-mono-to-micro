import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ClientManagementComponent } from './client-management/client-management.component';
import { LoanManagementComponent } from './loan-management/loan-management.component';
import { TransactionManagementComponent } from './transaction-management/transaction-management.component';
import { LoanAccountAddComponent } from './loan-account-add/loan-account-add.component';
import { ClientManagementAddComponent } from './client-management-add/client-management-add.component';
import { TransactionManagementAddComponent } from './transaction-management-add/transaction-management-add.component';


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
    path: 'loan-management',
    component: LoanManagementComponent
  },
  {
    path: 'transaction-management',
    component: TransactionManagementComponent
  },
  {
    path: 'loan-account-add',
    component: LoanAccountAddComponent
  },
  {
    path: 'client-management-add',
    component: ClientManagementAddComponent
  },
  {
    path: 'transaction-management-add',
    component: TransactionManagementAddComponent
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
