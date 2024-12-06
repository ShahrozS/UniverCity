import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProgramService {
  private getProgramApiURL = 'http://localhost:8090/programs';

  constructor(private http : HttpClient) { }

  getProgramNames(): Observable<any[]>{
    return this.http.get<any[]>(this.getProgramApiURL);
  } 
}
