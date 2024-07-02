import { NgModule , NO_ERRORS_SCHEMA} from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule, Routingcomponents } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { Child1Component } from './Components/child1/child1.component';
import { EmplistComponent } from './Components/emplist/emplist.component';
import { EmpdetailsComponent } from './Components/empdetails/empdetails.component';
import { EmployeeService } from './Services/employee.service';
import { HttpClientModule } from '@angular/common/http';
import { PagenotfoundComponent } from './Components/pagenotfound/pagenotfound.component';


@NgModule({
  declarations: [
    AppComponent,
    Child1Component,
    EmplistComponent,
    EmpdetailsComponent,
    Routingcomponents,
    PagenotfoundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent],
  schemas:[NO_ERRORS_SCHEMA,]
})
export class AppModule { }
