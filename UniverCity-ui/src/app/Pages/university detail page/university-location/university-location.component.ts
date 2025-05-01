// university-location.component.ts
import { Component, Input, OnInit, AfterViewInit, OnChanges, SimpleChanges, OnDestroy, ElementRef, ViewChild, NgZone } from '@angular/core';
import * as L from 'leaflet';
import '../../../../assets/map/assets-import';

@Component({
  selector: 'app-university-location',
  template: `
    <div class="map-container">
      <div #mapElement style="height: 400px; width: 100%;"></div>
    </div>
  `,
  styles: [`
    .map-container {
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
      margin: 20px 0;
    }
  `]
})
export class UniversityLocationComponent implements OnInit, AfterViewInit, OnChanges, OnDestroy {
  @ViewChild('mapElement') mapElement!: ElementRef;
  
  @Input() latitude: number = 51.505; // Default latitude
  @Input() longitude: number = -0.09; // Default longitude
  @Input() zoom: number = 13; // Default zoom level
  @Input() universityName: string = 'University';
  
  private map!: L.Map;
  private marker!: L.Marker;
  private initialized: boolean = false;
  private initTimer: any;

  constructor(private zone: NgZone) { }

  ngOnInit(): void {
    // Initialize default values if needed

    console.log("Printing on ng init" , this.latitude ," --- ", this.longitude)
    if (this.latitude === null || this.latitude === undefined) {
      this.latitude = 0;
    }
    if (this.longitude === null || this.longitude === undefined) {
      this.longitude = 0;
    }
  }

  ngAfterViewInit(): void {
    // Defer map initialization to ensure the view is fully rendered
    this.initTimer = setTimeout(() => {
      this.initMapWithSafeguards();
    }, 500);
  }

  ngOnChanges(changes: SimpleChanges): void {
    // Update map when inputs change - but only if initialized
    if (this.initialized && this.map && (changes['latitude'] || changes['longitude'])) {
      this.safeSyncMarkerWithCoordinates();
    }
  }

  ngOnDestroy(): void {
    // Clear any pending timers
    if (this.initTimer) {
      clearTimeout(this.initTimer);
    }
    
    // Clean up the map when component is destroyed
    if (this.map) {
      this.zone.runOutsideAngular(() => {
        this.map.remove();
      });
      this.map;
    }
  }

  private initMapWithSafeguards(): void {
    // Run outside Angular zone for better performance
    this.zone.runOutsideAngular(() => {
      try {
        // Ensure the view has been initialized and element exists
        if (!this.mapElement || !this.mapElement.nativeElement) {
          console.error('Map element not found in view');
          return;
        }

        // Ensure valid coordinates (default to 0,0 if invalid)
        const validLat = isNaN(this.latitude) ? 0 : this.latitude;
        const validLng = isNaN(this.longitude) ? 0 : this.longitude;
        const validZoom = isNaN(this.zoom) ? 10 : this.zoom;

        console.log('Initializing map with coordinates:', validLat, validLng);

        // Create map with direct reference to the native element
        const mapOptions: L.MapOptions = {
          center: L.latLng(validLat, validLng),
          zoom: validZoom,
          attributionControl: true
        };

        this.map = L.map(this.mapElement.nativeElement, mapOptions);

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(this.map);

        // Ensure map has been initialized correctly before adding markers
        this.map.whenReady(() => {
          this.addMarkerToMap(validLat, validLng);
          
          // Force a map size recalculation
          this.map.invalidateSize(true);
          
          this.initialized = true;
          console.log('Map initialization complete');
        });
      } catch (error) {
        console.error('Error initializing map:', error);
      }
    });
  }

  private addMarkerToMap(lat: number, lng: number): void {
    try {
      if (!this.map) return;

      // Create and add marker
      this.marker = L.marker([lat, lng]).addTo(this.map);
      
      // Add a popup to the marker
      this.marker.bindPopup(`${this.universityName}: ${lat}, ${lng}`).openPopup();
    } catch (error) {
      console.error('Error adding marker:', error);
    }
  }

  private safeSyncMarkerWithCoordinates(): void {
    this.zone.runOutsideAngular(() => {
      try {
        if (!this.map || !this.marker) return;
        
        // Ensure we have valid coordinates
        const validLat = isNaN(this.latitude) ? 0 : this.latitude;
        const validLng = isNaN(this.longitude) ? 0 : this.longitude;
        
        const newLatLng = L.latLng(validLat, validLng);
        
        // Update marker position
        this.marker.setLatLng(newLatLng);
        this.marker.bindPopup(`${this.universityName}: ${validLat}, ${validLng}`).openPopup();
        
        // Update map view
        this.map.setView(newLatLng, this.zoom);
      } catch (error) {
        console.error('Error updating marker position:', error);
      }
    });
  }
  
  // Public method to force map refresh - useful if container size changes
  public refreshMap(): void {
    if (this.map) {
      this.map.invalidateSize(true);
    }
  }
}