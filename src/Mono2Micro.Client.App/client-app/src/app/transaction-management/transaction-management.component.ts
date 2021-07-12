import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Transaction } from '../Models/transaction';
import { TransactionService } from '../services/transaction.service';

@Component({
  selector: 'app-transaction-management',
  templateUrl: './transaction-management.component.html',
  styleUrls: ['./transaction-management.component.css']
})

export class TransactionManagementComponent implements OnInit {
  public transactions: Transaction[] = [];

  constructor(private transactionService: TransactionService
    ,private router:Router) { }

  ngOnInit(): void {
    this.getTransaction();
  }

  getTransaction(){
    this.transactionService.getTransactions().subscribe((res: any) => {
      this.transactions = res;
      console.log(this.transactions);
    });
  }

  gotoTransactionAdd(){
    this.router.navigateByUrl('/transaction-management-add');
  }



}
