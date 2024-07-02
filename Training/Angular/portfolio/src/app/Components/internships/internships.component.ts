import { Component } from '@angular/core';
import { ProjectsService } from '../../Services/projects.service';

@Component({
  selector: 'app-internships',
  templateUrl: './internships.component.html',
  styleUrl: './internships.component.css'
})
export class InternshipsComponent {

  constructor(private proser:ProjectsService){}

  public internships: {
    company:string,
    type:string,
    location:string,
    link:string,
    project:string,
    des:string,
    course:string,
    certificate:string,
    technologies:Array<string>
  }[] = [];

  
  public errormsge = ""


  ngOnInit() {
    this.proser.getInternships()
      .subscribe(data => this.internships = data,
        error => this.errormsge = error
      );
  }
}
