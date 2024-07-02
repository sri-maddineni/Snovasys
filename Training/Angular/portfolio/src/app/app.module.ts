import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule, routings } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProjectsComponent } from './Components/projects/projects.component';
import { AchievementsComponent } from './Components/achievements/achievements.component';
import { GalleryComponent } from './Components/gallery/gallery.component';
import { PagenotfoundComponent } from './Components/pagenotfound/pagenotfound.component';
import { FooterComponent } from './Components/footer/footer.component';
import { BlogComponent } from './Components/blog/blog.component';
import { ProjectsService } from './Services/projects.service';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './Components/login/login.component';
import { InternshipsComponent } from './Components/internships/internships.component';
import { FormsModule } from '@angular/forms';
import { NavbarComponent } from './Components/navbar/navbar.component';


@NgModule({
  declarations: [
    AppComponent,
    routings,
    ProjectsComponent,
    AchievementsComponent,
    GalleryComponent,
    PagenotfoundComponent,
    FooterComponent,
    BlogComponent,
    LoginComponent,
    InternshipsComponent,
    AchievementsComponent,
    NavbarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [ProjectsService],
  bootstrap: [AppComponent]
})
export class AppModule { }
