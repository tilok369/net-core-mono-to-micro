import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FilterService {

  constructor(private http: HttpClient) { }

  getProductsFilter(){
    return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/products');
}

getDurationByProduct(productId:number){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/product-durations/'+productId);
  //return this.http.get(`https://localhost:44386/api/gateway/v1.0/filter/product-durations'{productId);
}

getInstallmentFrequencyByProduct(productId:number){
  return this.http.get('https://localhost:44386/api/gateway/v1.0/filter/product-frequencies/'+productId);

}
}
