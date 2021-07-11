import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { TransactionService } from '../services/transaction.service';
import { Transaction } from '../Models/transaction';
import { FilterService } from '../services/filter.service';

@Component({
  selector: 'app-transaction-management-add',
  templateUrl: './transaction-management-add.component.html',
  styleUrls: ['./transaction-management-add.component.css']
})
export class TransactionManagementAddComponent implements OnInit {
   formData : Transaction = new Transaction;
   transactions : any;
  constructor(private transactionService: TransactionService,
    private filterService: FilterService) { }

  ngOnInit(): void {
    this.getTransactionTypes();
  }

  onSubmit(form: NgForm) {
    this.transactionService.saveTransactions(this.formData).subscribe((res:any)=>{
      console.log(res);
    })
    console.log(this.formData);
  }


  getTransactionTypes(){
    this.filterService.getTransactionTypes().subscribe((res: any) => {
      this.transactions = res;
  });
}

}
