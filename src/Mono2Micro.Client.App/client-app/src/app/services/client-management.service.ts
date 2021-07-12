import { Injectable } from "@angular/core";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import { HttpRequestServiceService } from "./http-request-service.service";
//import { OidcSecurityService } from 'angular-auth-oidc-client';

@Injectable({
    providedIn: 'root'
})

export class ClientManagementService{

    constructor(private http: HttpClient, private requestHelper:HttpRequestServiceService){}

    getAllClient(){
        return this.http.get('https://localhost:44386/api/gateway/v1.0/identity/all',this.requestHelper.getHttpHeader());
    }

    saveClient(client:any){
        return this.http.post('https://localhost:44386/api/gateway/v1.0/identity/post',client);
    }
}
