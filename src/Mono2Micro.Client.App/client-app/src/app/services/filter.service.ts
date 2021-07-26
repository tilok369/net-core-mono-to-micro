import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { HttpRequestServiceService } from './http-request-service.service';

@Injectable({
  providedIn: 'root'
})
export class FilterService {

  constructor(private http: HttpClient, private requestHelper:HttpRequestServiceService) { }

  getProductsFilter(){
    return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/products',this.requestHelper.getHttpHeader());
}

getDurationByProduct(productId:number){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/product-durations/'+productId,this.requestHelper.getHttpHeader());
  //return this.http.get(`https://localhost:44386/api/gateway/v1.0/filter/product-durations'{productId);
}

getInstallmentFrequencyByProduct(productId:number){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/product-frequencies/'+productId,this.requestHelper.getHttpHeader());

}

getTransactionTypes(){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/transaction-types',this.requestHelper.getHttpHeader());
}

getIdentity(){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/get-identityall',this.requestHelper.getHttpHeader());
}

}
