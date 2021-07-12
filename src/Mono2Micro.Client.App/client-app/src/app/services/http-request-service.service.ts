import { Injectable } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';
import { OidcSecurityService } from 'angular-auth-oidc-client';

@Injectable({
  providedIn: 'root'
})
export class HttpRequestServiceService {

  constructor(public oidcSecurityService: OidcSecurityService ) {}

  public getHttpHeader(): any {
      let httpOptions = {
          headers: new HttpHeaders({
              'Access-Control-Allow-Headers': 'Content-Type, Authorization',
              'Access-Control-Allow-Origin': '*',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
          })
      };
      httpOptions.headers = httpOptions.headers.set('Authorization', 'Bearer ' + this.oidcSecurityService.getAccessToken());
      return httpOptions; 
  }
}
