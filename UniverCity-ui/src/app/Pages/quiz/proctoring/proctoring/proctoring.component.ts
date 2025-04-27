import { Component, OnInit, OnDestroy, ElementRef, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import * as faceapi from 'face-api.js';

@Component({
  selector: 'app-proctoring',
  templateUrl: './proctoring.component.html',
  styleUrls: ['./proctoring.component.scss']
})
export class ProctoringComponent implements OnInit, OnDestroy {
   private destroy$ = new Subject<void>();
    
    stream: MediaStream | null = null;
    loading = false;
    testStarted = false;
    cameraReady = false;
    faceDetected = false;
    sufficientLight = false;
    lightOffDuration = 0;
    lightOffStartTime: number | null = null;
    isForgotten = false;
    loadingModels = false;
    errorMessage = '';
  
 
 
    
  
    
    // Store direct references to elements
    videoElement: HTMLVideoElement | null = null;
    canvasElement: HTMLCanvasElement | null = null;
    
    constructor(private router: Router) {}
     async ngOnInit() {
        try {
          // Load face-api models
          await this.loadFaceDetectionModels();
          this.loadingModels = false;
        } catch (error) {
          console.error('Error loading face detection models:', error);
          this.errorMessage = 'Failed to load face detection models. Please refresh the page.';
        }
      }
      
      async loadFaceDetectionModels() {
        const url = 'https://justadudewhohacks.github.io/face-api.js/models';
        await faceapi.nets.tinyFaceDetector.loadFromUri(url);
        await faceapi.nets.faceLandmark68Net.loadFromUri(url);
      }
  
    async startCamera() {
      this.loading = true;
      this.errorMessage = '';
      this.videoElement = document.getElementById('video') as HTMLVideoElement;
      this.canvasElement = document.getElementById('canvas') as HTMLCanvasElement;
      
      if (!this.videoElement) {
        this.errorMessage = 'Video element not found';
        return;
      }
      
      if (!this.canvasElement) {
        this.errorMessage = 'canvas element not found';
        return;
      }
      
      try {
        const stream = await navigator.mediaDevices.getUserMedia({ video: true });
        this.stream = stream;
        this.videoElement.srcObject = stream;
        
        // Set camera ready once video is playing
        this.videoElement.onloadedmetadata = () => {
          this.videoElement?.play()
            .then(() => {
              console.log('Video is playing');
              this.cameraReady = true;
              this.loading= false;
              
              console.log(this.cameraReady);
              this.detectFace();
  
              console.log(".....")
  
            })
            .catch(err => {
              console.error('Play error:', err);
              this.errorMessage = 'Error playing video: ' + err.message;
            });
        };
      } catch (error: any) {
        console.error('Camera error:', error);
        this.errorMessage = 'Camera error: ' + error.message;
      }
    }
    
    async detectFace() {
      if (!this.videoElement || !this.canvasElement) return;
      
      const video = this.videoElement;
      const canvas = this.canvasElement;
      
      // Make sure video dimensions are available
      if (video.videoWidth === 0 || video.videoHeight === 0) {
        console.log('Waiting for video dimensions...');
        await new Promise<void>(resolve => {
          video.addEventListener('loadedmetadata', () => resolve(), { once: true });
        });
      }
      
      const displaySize = { width: video.videoWidth || 640, height: video.videoHeight || 480 };
      faceapi.matchDimensions(canvas, displaySize);
      
      const checkFace = async () => {
        if (this.isForgotten) return;
        
        try {
          const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
            .withFaceLandmarks();
          
          const resizedDetections = faceapi.resizeResults(detections, displaySize);
          
          const ctx = canvas.getContext('2d');
          if (ctx) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            faceapi.draw.drawDetections(canvas, resizedDetections);
            faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);
          }
          
          // Check if face is detected
          this.faceDetected = detections.length > 0;
          
          // Handle lighting conditions
          this.handleLightingConditions(video);
          
       
        } catch (error) {
          console.error('Error in face detection:', error);
        }
        
        // Continue checking as long as test is active
        if (!this.isForgotten) {
          requestAnimationFrame(checkFace);
        }
      };
      
      checkFace();
    }
     calculateBrightness(video: HTMLVideoElement): number {
       const canvas = document.createElement('canvas');
       const ctx = canvas.getContext('2d');
       if (!ctx) return 0;
       
       canvas.width = 50; // Sample size
       canvas.height = 50;
       
       ctx.drawImage(video, 0, 0, video.videoWidth, video.videoHeight, 0, 0, 50, 50);
       const imageData = ctx.getImageData(0, 0, 50, 50);
       const data = imageData.data;
       
       let brightness = 0;
       for (let i = 0; i < data.length; i += 4) {
         // Calculate relative luminance
         brightness += (data[i] * 0.299 + data[i + 1] * 0.587 + data[i + 2] * 0.114);
       }
       
       return brightness / (50 * 50);
     }
     
  
     // claude new functions 
     handleLightingConditions(video: HTMLVideoElement) {
      const brightness = this.calculateBrightness(video);
      this.sufficientLight = brightness > 30;
      
      if (!this.sufficientLight) {
        if (this.lightOffStartTime === null) {
          this.lightOffStartTime = Date.now();
        } else {
          this.lightOffDuration = (Date.now() - this.lightOffStartTime) / 1000;
          
          if (this.lightOffDuration >= 10 && this.testStarted) {
            this.forgeitTest('Insufficient lighting for more than 10 seconds');
          }
        }
      } else {
        this.lightOffStartTime = null;
        this.lightOffDuration = 0;
      }
    }
    
    // New method to check head position

    
    // New method to issue warnings
 
    
    startTest() {
      if (this.cameraReady && this.faceDetected && this.sufficientLight) {
        this.testStarted = true;
        this.lightOffDuration = 0;
        this.lightOffStartTime = null;
    

        this.router.navigate(['mock-test']);
        console.log('Test started!');
      } else {
        alert('Please ensure your camera is working, your face is visible, and lighting is sufficient.');
      }
    }
     
     forgeitTest(reason: string) {
       if (!this.isForgotten) {
         this.isForgotten = true;
         console.log(`Test forfeited: ${reason}`);
         
         alert(`Test forfeited: ${reason}`);
       }
     }
     
     ngOnDestroy() {
       this.destroy$.next();
       this.destroy$.complete();
       
       // Clean up camera stream
       if (this.stream) {
         this.stream.getTracks().forEach(track => track.stop());
       }
     }
}