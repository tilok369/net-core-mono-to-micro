import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { HttpRequestServiceService } from "./http-request-service.service";

@Injectable({
  providedIn: 'root'
})
export class TransactionService {

  constructor(private http: HttpClient, private requestHelper:HttpRequestServiceService) { }

  getTransactions(){
    return this.http.get('https://localhost:44386/api/gateway/v1.0/transaction/all',this.requestHelper.getHttpHeader());
  }

  saveTransactions(transaction:any){
    return this.http.post('https://localhost:44386/api/gateway/v1.0/transaction/post',transaction,this.requestHelper.getHttpHeader());

  }
}
