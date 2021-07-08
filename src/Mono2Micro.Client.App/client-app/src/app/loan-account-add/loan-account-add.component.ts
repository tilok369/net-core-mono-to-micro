import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { FilterService } from '../services/filter.service';
import { LoanAccountService } from '../services/loan-account.service';

@Component({
  selector: 'app-loan-account-add',
  templateUrl: './loan-account-add.component.html',
  styleUrls: ['./loan-account-add.component.css']
})
export class LoanAccountAddComponent implements OnInit {
  formData:any;
  products : any;
  durations : any;
  installmentFrequency: any;

  constructor(private filterService: FilterService,
    private loanAccountService: LoanAccountService) { }

  ngOnInit(): void {
    this.formData = {
      IdentityId: Number,
      ProductId: Number,
      Duration: Number,
      InstallmentFrequencyId : Number,
      DisbursedDate : Date,
      Amount : Number,
      Status : Boolean,
      CreatedOn : Date,
      CreatedBy : '',
      UpdatedOn : Date,
      UpdatedBy : '',
    }
    this.getProductsFilter();
  }


  onSubmit(form: NgForm) {
    this.loanAccountService.saveLoanAccounts(this.formData).subscribe((res:any)=>{
      console.log(res);
    })
    console.log(this.formData);
  }

  getProductsFilter(){
    this.filterService.getProductsFilter().subscribe((res: any) => {
      this.products = res;
      console.log(this.products);
  });

}
productChanged(){
  console.log(this.formData);
  if(!this.formData.ProductId)return;
  this.filterService.getDurationByProduct(this.formData.ProductId).subscribe((res: any)=>{
    this.durations = res;
  });

  this.filterService.getInstallmentFrequencyByProduct(this.formData.ProductId).subscribe((res: any)=>{
    this.installmentFrequency = res;
  });
}
}
