import { Component, OnInit } from '@angular/core';
import { ProjectsService } from '../../Services/projects.service';

@Component({
  selector: 'app-projects',
  templateUrl: './projects.component.html',
  styleUrl: './projects.component.css'
})
export class ProjectsComponent implements OnInit {

  
  constructor(private proser: ProjectsService) {}

  public projects:{ 
    title:string,
    code:string,
    type:string,
    link:string,
    des:string,
    use:string,
    featuredes:string,
    image:string,
    images:Array<string>,
    features:Array<string>,
    technologies:Array<string>
  }[] = [];
  public errormsge=""

  public imgappwidth:string=""
  public imgwebwidth:string=""


  ngOnInit(){
   this.proser.getProjects()
    .subscribe(data=>this.projects=data,
      error=>this.errormsge=error
    );
  }

}
