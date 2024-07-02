import { Component, Input, input } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl:'./app.component.html',
  template: `
    <div class="container">
      <div class="ngmodeld">
        <input type="text" [(ngModel)]="name">
        {{name}}
      </div>
      <div class="ngiff">
        <p *ngIf="condition; else elseblock">This is shown when condition is true</p>
        <ng-template #elseblock>
          <p>This is shown when condition is false</p>
        </ng-template>
      </div>
      <div class="ngswitch">
        <div [ngSwitch]="color">
          <div *ngSwitchCase="'red'">This is red</div>
          <div *ngSwitchCase="'green'">This is green</div>
          <div *ngSwitchCase="'blue'">This is blue</div>
          <div class="" *ngSwitchDefault>pick some</div>
        </div>
        <div class="ngfor">
          <ul *ngFor="let item of colors;index as i; first as f; last as l; odd as o; even as e;">
        <li>{{i}} {{f}}  {{item}} {{l}} {{o}} {{e}}</li></ul>
        </div>
      </div>
    </div>
  `,
  styles: [`
    
  `]
})
export class AppComponent {
  name = '';
  color = 'sdf';
  condition = true;
  datar="this is transferred datasdf"; //parent to child data passing
  public colors=[3,4,2,"it",'sdf',2.3]

  @Input() public childevent:string="";

}
