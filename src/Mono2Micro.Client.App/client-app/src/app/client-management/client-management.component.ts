import { Component, OnInit } from '@angular/core';
import { Identity } from '../Models/Identity';
import { LoanAccount } from '../Models/loanAccount';
import { ClientManagementService } from '../services/client-management.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-loan-management',
  templateUrl: './client-management.component.html',
  styleUrls: ['./client-management.component.css']
})
export class ClientManagementComponent implements OnInit {

  public clients : Identity[] = [];

  constructor(private clientManagementService: ClientManagementService,
    private router:Router) { }

  ngOnInit(): void {
    this.getAllClient();
  }

  getAllClient(){
    this.clientManagementService.getAllClient().subscribe((res: any) => {
      this.clients = res;
      console.log(this.clients);
    });
  }

  gotoClientManagementAdd(){
    this.router.navigateByUrl('/client-management-add');
  }

}
