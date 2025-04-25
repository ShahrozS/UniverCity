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
  testStarted = false;
  cameraReady = false;
  faceDetected = false;
  sufficientLight = false;
  lookingDown = 0;
  lightOffDuration = 0;
  lightOffStartTime: number | null = null;
  isForgotten = false;
  loadingModels = true;
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
    this.errorMessage = '';
    
    // Get direct references to DOM elements
    this.videoElement = document.getElementById('video') as HTMLVideoElement;
    this.canvasElement = document.getElementById('canvas') as HTMLCanvasElement;
    
    if (!this.videoElement || !this.canvasElement) {
      this.errorMessage = 'Video or canvas element not found';
      return;
    }
    
    try {
      this.stream = await navigator.mediaDevices.getUserMedia({
        video: {
          width: 640,
          height: 480,
          facingMode: 'user'
        }
      });
      
      console.log('Camera access granted');
      
      // Set up metadata loading handler before setting srcObject
      this.videoElement.onloadedmetadata = () => {
        console.log('Video metadata loaded');
        // Let's ensure play() is called after metadata loads
        this.videoElement?.play()
          .then(() => {
            console.log('Video is playing');
            this.cameraReady = true;
            // Start face detection now that we know video is playing
            this.detectFace();
          })
          .catch(err => {
            console.error('Error playing video:', err);
            this.errorMessage = 'Error playing video: ' + err.message;
          });
      };
      
      // Now set the srcObject
      this.videoElement.srcObject = this.stream;
      console.log('Stream attached:', this.stream);
      
    } catch (error:any) {
      console.error('Error accessing camera:', error);
      if (error.name === 'NotAllowedError') {
        this.errorMessage = 'Camera access was denied. Please allow camera access in your browser settings.';
      } else if (error.name === 'NotFoundError') {
        this.errorMessage = 'No camera found. Please connect a camera and try again.';
      } else {
        this.errorMessage = `Unable to access camera: ${error.name} - ${error.message}`;
      }
    }
  }
  
  async detectFace() {
    if (!this.videoElement || !this.canvasElement) return;
    
    const video = this.videoElement;
    const canvas = this.canvasElement;
    
    // Make sure video dimensions are available
    if (video.videoWidth === 0 || video.videoHeight === 0) {
      console.log('Waiting for video dimensions...');
      // Wait for metadata to load if dimensions aren't available
      await new Promise<void>(resolve => {
        video.addEventListener('loadedmetadata', () => resolve(), { once: true });
      });
    }
    
    // Use videoWidth/videoHeight instead of width/height
    const displaySize = { width: video.videoWidth || 640, height: video.videoHeight || 480 };
    console.log("Display Size:", displaySize);
    
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
        
        // The rest of your face detection code remains the same
        // Check light conditions by analyzing brightness
        if (this.faceDetected) {
          const brightness = this.calculateBrightness(video);
          this.sufficientLight = brightness > 50;
          
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
          
          // Check if looking down (using y position of nose relative to eyes)
          if (detections.length > 0 && detections[0].landmarks) {
            const landmarks = detections[0].landmarks.positions;
            const leftEye = landmarks[37]; // left eye
            const rightEye = landmarks[46]; // right eye
            const nose = landmarks[30]; // nose tip
            
            // If nose is significantly lower than eyes, person might be looking down
            if (nose.y > (leftEye.y + 30) && nose.y > (rightEye.y + 30)) {
              this.lookingDown++;
              
              if (this.lookingDown >= 3 && this.testStarted) {
                this.forgeitTest('Looking down detected 3 times');
              }
            }
          }
        } else {
          // No face detected scenario
          if (this.testStarted) {
            const brightness = this.calculateBrightness(video);
            this.sufficientLight = brightness > 50;
            
            if (!this.sufficientLight) {
              if (this.lightOffStartTime === null) {
                this.lightOffStartTime = Date.now();
              } else {
                this.lightOffDuration = (Date.now() - this.lightOffStartTime) / 1000;
                
                if (this.lightOffDuration >= 10) {
                  this.forgeitTest('Insufficient lighting for more than 10 seconds');
                }
              }
            }
          }
        }
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
  
  startTest() {
    if (this.cameraReady && this.faceDetected && this.sufficientLight) {
      this.testStarted = true;
      this.lookingDown = 0;
      this.lightOffDuration = 0;
      this.lightOffStartTime = null;
      
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