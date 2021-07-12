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
import { ClientManagementAddComponent } from './client-management-add/client-management-add.component';
import {ClientManagementService} from './services/client-management.service';
import { FormsModule } from '@angular/forms';
import { LoanAccountAddComponent } from './loan-account-add/loan-account-add.component';
import { AuthModule, LogLevel } from 'angular-auth-oidc-client';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ClientManagementComponent,
    LoanManagementComponent,
    TransactionManagementComponent,
    ClientManagementAddComponent,
    LoanAccountAddComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    AuthModule.forRoot({
      config: {
        authority: 'https://localhost:44310',
        redirectUrl: window.location.origin,
        postLogoutRedirectUri: window.location.origin,
        clientId: 'angular',
        scope: 'openid ApiOne',
        responseType: 'code',
        silentRenew: true,
        useRefreshToken: true,
        logLevel: LogLevel.Debug,
      },
    }),
  ],
  providers: [
    LoanAccountService,
    ClientManagementService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
