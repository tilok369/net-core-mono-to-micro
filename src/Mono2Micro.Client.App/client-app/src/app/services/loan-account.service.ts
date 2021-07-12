import { Injectable } from "@angular/core";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import { HttpRequestServiceService } from "./http-request-service.service";

@Injectable({
    providedIn: 'root'
})

export class LoanAccountService{

    constructor(private http: HttpClient, private requestHelper:HttpRequestServiceService){}

    getLoanAccounts(){
        return this.http.get('https://localhost:44386/api/gateway/v1.0/account/all',this.requestHelper.getHttpHeader());
    }

    saveLoanAccounts(loanAccount:any){
      return this.http.post('https://localhost:44386/api/gateway/v1.0/account/post',loanAccount,this.requestHelper.getHttpHeader());
  }

  getLoanSchedule(duration:number, frequency:number, amount:number, disbursedDate:Date){
    return this.http.get('https://localhost:44386/api/gateway/v1.0/account/schedule/'+ duration +"/" + frequency + "/"+ amount + "/" + disbursedDate);
}


}
