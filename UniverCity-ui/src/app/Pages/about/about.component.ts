import { Component } from '@angular/core';
import { Router, RouterLink, RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-about',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './about.component.html',
  styleUrl: './about.component.scss'
})
export class AboutComponent {
  programs: any[] = [];

  constructor(private router: Router){
    
  }

  onLinkClick(event: Event) {
    event.preventDefault(); // Prevent default link behavior if needed
    const clickedText = (event.target as HTMLElement).getAttribute('data-program');
    this.router.navigate(['/university-by-program-list'],{queryParams : {program : clickedText}});
    // Use `clickedText` as needed, e.g., navigation or other logic
  }


}
