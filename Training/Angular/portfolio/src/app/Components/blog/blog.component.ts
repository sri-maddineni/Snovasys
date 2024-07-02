import { Component } from '@angular/core';
import { ProjectsService } from '../../Services/projects.service';

@Component({
  selector: 'app-blog',
  templateUrl: './blog.component.html',
  styleUrl: './blog.component.css'
})
export class BlogComponent {

  
  constructor(private blogser: ProjectsService) { }

  public blogs: {
    date: string,
    link: string,
    tags: Array<string>,
    title: string,
    des: string,
    images: Array<string>
  }[] = [];


  public errormsge = ""


  ngOnInit() {
    this.blogser.getBlogs()
      .subscribe(data => this.blogs = data.reverse(),
        error => this.errormsge = error
      );
  }

  public title=""
  public des=""
  public date=""
  public tags=""
  public link=""
  public em=""


  onSubmit(){

  }

}
