import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  public clicked:boolean=false
 


  statechange(){
    this.clicked=!this.clicked
    
    console.log(this.clicked)
  }


}
