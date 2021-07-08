import { Injectable } from "@angular/core";
import {HttpClient, HttpHeaders} from "@angular/common/http";

@Injectable({
    providedIn: 'root'
})

export class LoanAccountService{

    constructor(private http: HttpClient){}

    getLoanAccounts(){
        return this.http.get('https://localhost:44386/api/gateway/v1.0/account/all');
    }

    saveLoanAccounts(loanAccount:any){
      return this.http.post('https://localhost:44386/api/gateway/v1.0/account/post',loanAccount);
  }


}
