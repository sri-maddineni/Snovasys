import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-child1',
  template: `
    <div class="container">
      <div class="datasent">
        {{data}}
      </div>
      <div class="EventEmit">
        <button (click)="fire()">send</button>
      </div>
    </div>
  `,
  styleUrl: './child1.component.css'
})
export class Child1Component {
  @Input() public data:string="";
  @Output() public childevent=new EventEmitter();

  fire(){
    this.childevent.emit("hello parent, i m child")
    console.log("sent done!")
  }


  constructor(){
  
  }
}
