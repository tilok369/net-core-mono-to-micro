import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http'

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { ClientManagementComponent } from './client-management/client-management.component';
import { LoanManagementComponent } from './loan-management/loan-management.component';
import { TransactionManagementComponent } from './transaction-management/transaction-management.component';

import { LoanAccountService } from './services/loan-account.service';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ClientManagementComponent,
    LoanManagementComponent,
    TransactionManagementComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    LoanAccountService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
