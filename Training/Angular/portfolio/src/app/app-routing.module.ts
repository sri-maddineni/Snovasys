import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './Components/home/home.component';
import { HeaderComponent } from './Components/header/header.component';
import { ProjectsComponent } from './Components/projects/projects.component';
import { GalleryComponent } from './Components/gallery/gallery.component';
import { PagenotfoundComponent } from './Components/pagenotfound/pagenotfound.component';
import { AchievementsComponent } from './Components/achievements/achievements.component';
import { LoginComponent } from './Components/login/login.component';
import { InternshipsComponent } from './Components/internships/internships.component';
import { BlogComponent } from './Components/blog/blog.component';

const routes: Routes = [
  { path: "", component: HomeComponent },
  { path: "projects", component: ProjectsComponent },
  { path: "achievements", component: AchievementsComponent },
  { path: "gallery", component: GalleryComponent },
  { path: "login", component: LoginComponent },
  { path:"internships", component:InternshipsComponent},
  { path: "blog", component:BlogComponent},
  { path: "**", component: PagenotfoundComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routings = [HomeComponent, HeaderComponent,BlogComponent, ProjectsComponent, AchievementsComponent, GalleryComponent, PagenotfoundComponent, LoginComponent]
