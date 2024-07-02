import { Component } from '@angular/core';
import { ProjectsService } from '../../Services/projects.service';

@Component({
  selector: 'app-achievements',
  templateUrl: './achievements.component.html',
  styleUrl: './achievements.component.css'
})
export class AchievementsComponent {

  constructor(private proser: ProjectsService) { }

  public ach: {
    date: string,
    location: string,
    chief: Array<string>,
    title: string,
    des: string,
    images: Array<string>
  }[] = [];


  public errormsge = ""


  ngOnInit() {
    this.proser.getAch()
      .subscribe(data => this.ach = data.reverse(),
        error => this.errormsge = error
      );
  }
}
