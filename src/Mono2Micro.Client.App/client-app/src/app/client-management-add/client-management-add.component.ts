import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ClientManagementService } from '../services/client-management.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-client-management-add',
  templateUrl: './client-management-add.component.html',
  styleUrls: ['./client-management-add.component.css']
})
export class ClientManagementAddComponent implements OnInit {
  formData:any
  constructor(private clientManagementService: ClientManagementService, private router : Router) {
    
   }

  ngOnInit(): void {
    this.formData = {
      FirstName: '',
      LastName: '',
      Email: '',
      Phone: '',
      IdentityNumber: '',
      TypeId : 1,
      Status: true
      
    }
  }
  onSubmit(form: NgForm) {
    console.log(this.formData);
    this.clientManagementService.saveClient(this.formData).subscribe((res: any) => {
      console.log(res);
      if(res.Success){
        alert('Saved successfully');
        this.router.navigateByUrl('/client-management');
      }
    });
  }

}
