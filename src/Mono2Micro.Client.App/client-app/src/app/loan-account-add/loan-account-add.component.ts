import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { FilterService } from '../services/filter.service';
import { LoanAccountService } from '../services/loan-account.service';
import { LoanAccount } from '../Models/loanAccount';
import { LoanSchedule } from '../Models/loanSchedule';
import { Router } from '@angular/router';

@Component({
  selector: 'app-loan-account-add',
  templateUrl: './loan-account-add.component.html',
  styleUrls: ['./loan-account-add.component.css']
})
export class LoanAccountAddComponent implements OnInit {
  formData: LoanAccount = new LoanAccount;
  schedules: LoanSchedule [] = [];
  products : any;
  identities : any;
  durations : any;
  installmentFrequency: any;

  constructor(private filterService: FilterService,
    private loanAccountService: LoanAccountService, private router: Router) { }

  ngOnInit(): void {
    this.getProductsFilter();
    this.getIdentityFilter();
  }


  onSubmit(form: NgForm) {
    this.loanAccountService.saveLoanAccounts(this.formData).subscribe((res:any)=>{
      console.log(res);
      if(res.Success){
        this.router.navigateByUrl('/loan-management');
      }
    })
    console.log(this.formData);
  }

  getProductsFilter(){
    this.filterService.getProductsFilter().subscribe((res: any) => {
      this.products = res;
      console.log(this.products);
  });
}

getIdentityFilter(){
  this.filterService.getIdentity().subscribe((res: any) => {
    this.identities = res;
    console.log(this.identities);
});
}

gotoschedule(){
  this.getLoanSchedule();
}

getLoanSchedule(){
  {
    this.loanAccountService.getLoanSchedule(this.formData.Duration, this.formData.InstallmentFrequencyId,
      this.formData.Amount, this.formData.DisbursedDate).subscribe((res: any)=>{
        this.schedules = res;

      });

  }

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
