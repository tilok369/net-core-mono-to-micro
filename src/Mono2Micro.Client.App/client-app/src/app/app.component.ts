import { Component, OnInit } from '@angular/core';
import { OidcSecurityService } from 'angular-auth-oidc-client';
import { HttpHeaders,HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  constructor(public oidcSecurityService: OidcSecurityService, private http: HttpClient) {}
  title = 'client-app';


//   const token = this.oidcSecurityServices.getAccessToken();

// const httpOptions = {
//   headers: new HttpHeaders({
//     Authorization: 'Bearer ' + token,
//   }),
// };
  ngOnInit() {
    this.oidcSecurityService.checkAuth().subscribe(({ isAuthenticated, userData, accessToken, idToken }) => {
      if(!isAuthenticated)
      this.login();
    });
  }
  printToken(){
    console.log(this.oidcSecurityService.getAccessToken());
  }
  login() {
    this.oidcSecurityService.authorize();
  }

  logout() {
    this.oidcSecurityService.logoff();
  }
  //   callapi(){
  //     const token = this.oidcSecurityService.getAccessToken();
  //     const httpOptions = {
  //     headers: new HttpHeaders({
  //     Authorization: 'Bearer ' + token,
  //   }),
  // };
  //   return this.http.get('https://localhost:44386/api/gateway/v1.0/account/all',httpOptions).subscribe((res: any) => {
  //    var ress= res;
  //     console.log(ress);
  //   });
  // }
}
