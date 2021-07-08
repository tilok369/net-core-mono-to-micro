import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LoanAccount } from '../Models/loanAccount';
import { LoanAccountService } from '../services/loan-account.service';

@Component({
  selector: 'app-client-management',
  templateUrl: './loan-management.component.html',
  styleUrls: ['./loan-management.component.css']
})
export class LoanManagementComponent implements OnInit {

  public loanAccounts: LoanAccount[] = [];
  constructor(private loanAccountService: LoanAccountService
    ,private router:Router) { }

  ngOnInit(): void {
    this.getLoanAccounts();
  }

  getLoanAccounts(){
    this.loanAccountService.getLoanAccounts().subscribe((res: any) => {
      this.loanAccounts = res;
      console.log(this.loanAccounts);
    });
  }

  gotoLoanAccountAdd(){
    this.router.navigateByUrl('/loan-account-add');
  }

}
