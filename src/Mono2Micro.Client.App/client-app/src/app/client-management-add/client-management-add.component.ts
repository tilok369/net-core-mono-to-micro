import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-client-management-add',
  templateUrl: './client-management-add.component.html',
  styleUrls: ['./client-management-add.component.css']
})
export class ClientManagementAddComponent implements OnInit {
  formData:any
  constructor() {
    
   }

  ngOnInit(): void {
    this.formData = {
      FirstName: '',
      LastName: '',
      Email: '',
      PhoneNumber: '',
      
    }
  }
  onSubmit(form: NgForm) {
    console.log(this.formData);
  }

}
