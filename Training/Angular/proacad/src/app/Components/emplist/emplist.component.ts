import { Component, OnInit } from '@angular/core';
import { EmployeeService } from '../../Services/employee.service';

@Component({
  selector: 'app-emplist',
  templateUrl: './emplist.component.html',
  styleUrls: ['./emplist.component.css'] // Corrected property name to styleUrls
})
export class EmplistComponent implements OnInit{

  constructor(private empser: EmployeeService) {}

  public emps:{ name: string; position: string; salary: number; }[] = [];
  public errormsge=""

  ngOnInit(){
   this.empser.getEmployees()
    .subscribe(data=>this.emps=data,
      error=>this.errormsge=error
    );
  }

}
