import { Component, OnInit, OnDestroy, ElementRef, ViewChild, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import * as faceapi from 'face-api.js';
@Component({
  selector: 'app-proctoring-while-test',
  templateUrl: './proctoring-while-test.component.html',
  styleUrl: './proctoring-while-test.component.scss'
})
export class ProctoringWhileTestComponent implements OnInit, OnDestroy {
  @Input() active: boolean = false; // Whether proctoring is active
  @ViewChild('video') videoRef!: ElementRef;
  @ViewChild('canvas') canvasRef!: ElementRef;
  
  private destroy$ = new Subject<void>();
  
  stream: MediaStream | null = null;
  cameraReady = false;
  faceDetected = false;
  sufficientLight = false;
  lookingDown = 0;
  lightOffDuration = 0;
  lightOffStartTime: number | null = null;
  isForgotten = false;
  loadingModels = false;
  errorMessage = '';
  
  // eyes/face down detection
  lookingDownStartTime: number | null = null;
  lookingDownDuration = 0;
  lookingDownWarnings = 0;
  MAX_WARNINGS = 3;
  LOOKING_DOWN_THRESHOLD = 5 * 1000; // 5 seconds in milliseconds
  isWarningActive = false;
  
  // Store direct references to elements
  videoElement: HTMLVideoElement | null = null;
  canvasElement: HTMLCanvasElement | null = null;
  
  constructor(private router:Router) {}
  
  async ngOnInit() {
    this.loadingModels = true;
    try {
      // Load face-api models
      await this.loadFaceDetectionModels();
      this.loadingModels = false;
      // Start camera automatically
      this.startCamera();
    } catch (error) {
      console.error('Error loading face detection models:', error);
      this.errorMessage = 'Failed to load models';
      this.loadingModels = false;
    }
  }
  
  async loadFaceDetectionModels() {
    const url = 'https://justadudewhohacks.github.io/face-api.js/models';
    await faceapi.nets.tinyFaceDetector.loadFromUri(url);
    await faceapi.nets.faceLandmark68Net.loadFromUri(url);
  }
  
  async startCamera() {
    this.errorMessage = '';
    if(!this.active){
      return;
    }

    try {
      const stream = await navigator.mediaDevices.getUserMedia({ video: true });
      this.stream = stream;
      
      // Wait for ViewChild to be available
      setTimeout(() => {
        if (this.videoRef && this.videoRef.nativeElement) {
          this.videoElement = this.videoRef.nativeElement;

          if(this.videoElement)
          this.videoElement.srcObject = stream;
          
          if(this.videoElement)
          this.videoElement.onloadedmetadata = () => {
            this.videoElement?.play()
              .then(() => {
                console.log('Video is playing');
                this.cameraReady = true;
                
                if (this.canvasRef && this.canvasRef.nativeElement) {
                  this.canvasElement = this.canvasRef.nativeElement;
                  this.detectFace();
                }
              })
              .catch(err => {
                console.error('Play error:', err);
                this.errorMessage = 'Camera error';
              });
          };
        }
      }, 0);
    } catch (error: any) {
      console.error('Camera error:', error);
      this.errorMessage = 'Camera error';
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
    
    const displaySize = { width: video.videoWidth, height: video.videoHeight };
    faceapi.matchDimensions(canvas, displaySize);
    
    const checkFace = async () => {
      if (this.isForgotten) return;
      
      try {
        const detections = await faceapi.detectAllFaces(video, new faceapi.TinyFaceDetectorOptions())
          .withFaceLandmarks();
        
        const resizedDetections = faceapi.resizeResults(detections, displaySize);
        
        // Check if face is detected
        this.faceDetected = detections.length > 0;
        
        // Handle lighting conditions
        this.handleLightingConditions(video);
        
        // Check head position if face is detected
        if (this.faceDetected && detections.length > 0) {
          this.checkHeadPosition(detections[0].landmarks.positions);
        } else {
          // Reset looking down timer if no face detected
          this.lookingDownStartTime = null;
          this.lookingDownDuration = 0;
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
  
  handleLightingConditions(video: HTMLVideoElement) {
    const brightness = this.calculateBrightness(video);
    this.sufficientLight = brightness > 30;
    console.log(this.sufficientLight + " ----- " + brightness);

    if (!this.sufficientLight && this.active) {
      console.log("LOW LIGHT");
      if (this.lightOffStartTime === null) {
        this.lightOffStartTime = Date.now();
      } else {
        this.lightOffDuration = (Date.now() - this.lightOffStartTime) / 1000;
        
        if (this.lightOffDuration >= 10) {
          this.forgeitTest('Insufficient lighting for more than 10 seconds');
        }
      }
    } else {
      this.lightOffStartTime = null;
      this.lightOffDuration = 0;
    }
  }
  
  checkHeadPosition(landmarks: any[]) {
    if (!this.active) return;
    
    // Calculate eye positions
    const leftEyeY = (landmarks[37].y + landmarks[41].y) / 2;  // left eye center points
    const rightEyeY = (landmarks[44].y + landmarks[46].y) / 2; // right eye center points
    const eyeAvgY = (leftEyeY + rightEyeY) / 2;
    
    // Calculate nose position (use nose tip)
    const noseY = landmarks[30].y;
    
    // Calculate chin position
    const chinY = landmarks[8].y;
    
    // More accurate face measurements
    const faceHeight = chinY - landmarks[27].y; // Distance from chin to top of nose bridge
    
    // Calculate nose-to-eye ratio - this is the key metric
    const noseEyeDistance = noseY - eyeAvgY;
    const noseEyeRatio = noseEyeDistance / faceHeight;
    
    // Calibration: determine a baseline ratio when looking straight
    const lookingDownThreshold = 0.36; // Adjust based on testing
    const isLookingDown = noseEyeRatio > lookingDownThreshold;
    
    if (isLookingDown) {
      // Start or continue tracking looking down duration
      if (this.lookingDownStartTime === null) {
        this.lookingDownStartTime = Date.now();
      }
      
      this.lookingDownDuration = Date.now() - this.lookingDownStartTime;
      
      // Check if exceeded threshold and not currently showing a warning
      if (this.lookingDownDuration >= this.LOOKING_DOWN_THRESHOLD && !this.isWarningActive) {
        this.issueLookingDownWarning();
      }
    } else {
      // Reset looking down timer
      if (this.lookingDownStartTime !== null) {
        this.lookingDownStartTime = null;
        this.lookingDownDuration = 0;
      }
    }
  }
  
  issueLookingDownWarning() {
    this.lookingDownWarnings++;
    this.isWarningActive = true;
    
    // Show warning to user
    const warningsLeft = this.MAX_WARNINGS - this.lookingDownWarnings;
    
    if (this.lookingDownWarnings >= this.MAX_WARNINGS) {
      this.forgeitTest('Looking down detected too many times. Test terminated.');
      this.router.navigate(["/quiz-options"]);
    } else {
      alert(`Warning: Looking down detected for an extended period. ${warningsLeft} warnings remaining before disqualification.`);
      
      // Reset warning state after a delay
      setTimeout(() => {
        this.isWarningActive = false;
        this.lookingDownStartTime = null;
        this.lookingDownDuration = 0;
      }, 3000);
    }
  }
  
  forgeitTest(reason: string) {
    if (!this.isForgotten) {
      this.isForgotten = true;
      console.log(`Test forfeited: ${reason}`);
      
      alert(`Test forfeited: ${reason}`);
      // You might want to emit an event here to notify the parent component
    }
  }
  
  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
    
    this.active = false;
    // Clean up camera stream
    if (this.stream) {
      this.stream.getTracks().forEach(track => track.stop());
    }
  }
}
