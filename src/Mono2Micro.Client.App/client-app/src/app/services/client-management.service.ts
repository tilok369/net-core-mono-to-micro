import { Injectable } from "@angular/core";
import {HttpClient, HttpHeaders} from "@angular/common/http";

@Injectable({
    providedIn: 'root'
})

export class ClientManagementService{

    constructor(private http: HttpClient){}

    getAllClient(){
        return this.http.get('https://localhost:44386/api/gateway/v1.0/identity/all');
    }

    saveClient(client:any){
        return this.http.post('https://localhost:44386/api/gateway/v1.0/identity/post',client);
    }
}
