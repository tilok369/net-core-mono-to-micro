import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { TransactionService } from '../services/transaction.service';
import { Transaction } from '../Models/transaction';
import { FilterService } from '../services/filter.service';
import { LoanAccountService } from '../services/loan-account.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-transaction-management-add',
  templateUrl: './transaction-management-add.component.html',
  styleUrls: ['./transaction-management-add.component.css']
})
export class TransactionManagementAddComponent implements OnInit {
   formData : Transaction = new Transaction;
   transactions : any;
   loanAccounts : any;
  constructor(private transactionService: TransactionService,
    private filterService: FilterService,
    private loanAccountService : LoanAccountService,
    private router: Router) { }

  ngOnInit(): void {
    this.getTransactionTypes();
    this.getLoanAccounts();
  }

  onSubmit(form: NgForm) {
    this.transactionService.saveTransactions(this.formData).subscribe((res:any)=>{
      console.log(res);
      if(res.Success){
        this.router.navigateByUrl('/transaction-management');
      }
    })
    console.log(this.formData);
  }


  getTransactionTypes(){
    this.filterService.getTransactionTypes().subscribe((res: any) => {
      this.transactions = res;
  });
}

getLoanAccounts(){
  this.loanAccountService.getLoanAccounts().subscribe((res: any) => {
    this.loanAccounts = res;
});

}

}
