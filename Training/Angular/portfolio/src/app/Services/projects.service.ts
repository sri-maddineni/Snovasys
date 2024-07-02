import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';

import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Iproject } from '../Interfaces/Projectsinterface';
import { InternshipInterface } from '../Interfaces/InternshipInterface';
import { AchInter } from '../Interfaces/AchInterface';
import { Bloginter } from '../Interfaces/BlogInter';

@Injectable({
  providedIn: 'root'
})
export class ProjectsService {

  constructor(private http: HttpClient) { }

  getProjects(): Observable<Iproject[]> {
    return this.http.get<Iproject[]>("/assets/Data/Projects.json")
      .pipe(
        catchError(this.errorHandler)
      );
  }

  getInternships(): Observable<InternshipInterface[]> {
    return this.http.get<InternshipInterface[]>("/assets/Data/Internships.json")
      .pipe(
        catchError(this.errorHandler)
      );
  }

  getAch(): Observable<AchInter[]> {
    return this.http.get<AchInter[]>("/assets/Data/Achievements.json")
      .pipe(
        catchError(this.errorHandler)
      );
  }

  getBlogs(): Observable<Bloginter[]> {
    return this.http.get<Bloginter[]>("/assets/Data/Blogs.json")
      .pipe(
        catchError(this.errorHandler)
      );
  }

  errorHandler(error: HttpErrorResponse): Observable<never> {
    return throwError(error.message || "Server error");
  }
}
