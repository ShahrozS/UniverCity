// proctoring.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface ProctorEvent {
  type: 'looking_down' | 'insufficient_light' | 'face_not_detected';
  timestamp: number;
  duration?: number;
  count?: number;
}

@Injectable({
  providedIn: 'root'
})
export class ProctoringService {
  private apiUrl = '/api/proctoring'; // Adjust to your backend URL
  
  constructor(private http: HttpClient) { }
  
  // Method to report proctoring violations to backend
  reportViolation(event: ProctorEvent): Observable<any> {
    return this.http.post(`${this.apiUrl}/violation`, event);
  }
  
  // Method to start the proctored test
  startProctoredTest(testId: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/start`, { testId });
  }
  
  // Method to end the test (forfeit or completion)
  endTest(testId: string, reason: string, wasForfeited: boolean): Observable<any> {
    return this.http.post(`${this.apiUrl}/end`, {
      testId,
      reason,
      wasForfeited
    });
  }
}