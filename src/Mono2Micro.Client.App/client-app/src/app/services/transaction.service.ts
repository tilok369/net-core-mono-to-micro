import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class TransactionService {

  constructor(private http: HttpClient) { }

  getTransactions(){
    return this.http.get('https://localhost:44386/api/gateway/v1.0/transaction/all');
  }

  saveTransactions(transaction:any){
    return this.http.post('https://localhost:44386/api/gateway/v1.0/transaction/post',transaction);

  }
}
