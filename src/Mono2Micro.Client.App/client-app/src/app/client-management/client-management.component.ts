import { Component, OnInit } from '@angular/core';
import { LoanAccount } from '../Models/loanAccount';
import { LoanAccountService } from '../services/loan-account.service';

@Component({
  selector: 'app-client-management',
  templateUrl: './client-management.component.html',
  styleUrls: ['./client-management.component.css']
})
export class ClientManagementComponent implements OnInit {

  public loanAccounts: LoanAccount[] = [];
  constructor(private loanAccountService: LoanAccountService) { }

  ngOnInit(): void {
    this.getLoanAccounts();
  }

  getLoanAccounts(){
    this.loanAccountService.getLoanAccounts().subscribe((res: any) => {
      this.loanAccounts = res;
      console.log(this.loanAccounts);
    });
  }

}
