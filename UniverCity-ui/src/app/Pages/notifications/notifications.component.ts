import { Component, OnInit, OnDestroy, HostListener } from '@angular/core';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { NotificationsService } from '../../Services/services';
import { Notification } from '../../Services/models';
import { faBell } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-notifications',
  templateUrl: './notifications.component.html',
  styleUrls: ['./notifications.component.scss']
})
export class NotificationsComponent implements OnInit, OnDestroy {
  faBell = faBell
  notifications: Notification[] = [];
  unreadCount = 0;
  isPanelOpen = false;
  currentPage = 0;
  pageSize = 10;
  hasMoreNotifications = true;
  isLoading = false;
  private subscriptions: Subscription[] = [];

  constructor(
    private notificationService: NotificationsService,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Subscribe to unread notifications count
    this.subscriptions.push(
      this.notificationService.getUnreadNotificationsCount().subscribe(count => {
        this.unreadCount = count;
      })
    );


    // Get initial count
    this.notificationService.getUnreadNotificationsCount().subscribe();
  }

  togglePanel(): void {
    this.isPanelOpen = !this.isPanelOpen;
    
    if (this.isPanelOpen) {
      this.loadNotifications();
      
      // Mark all as read when opening panel
      this.notificationService.markAllAsRead().subscribe(() => {
        this.notificationService.getUnreadNotificationsCount().subscribe();
      });
    }
  }

  loadNotifications(refresh: boolean = true): void {
    if (refresh) {
      this.currentPage = 0;
      this.notifications = [];
      this.hasMoreNotifications = true;
    }
    
    if (!this.hasMoreNotifications || this.isLoading) {
      return;
    }
    
    this.isLoading = true;
    
    this.notificationService.getUserNotifications({page: this.currentPage,size:this.pageSize})
      .subscribe(response => {
        if (refresh) {
          this.notifications = response.content!;
        } else {
          this.notifications = [...this.notifications, ...response.content!];
        }
        
        this.isLoading = false;
        this.hasMoreNotifications = response.content!.length === this.pageSize;
        this.currentPage++;
      });
  }

  loadMore(): void {
    this.loadNotifications(false);
  }

  viewNotification(notification: Notification): void {
    // Mark notification as opened
    this.notificationService.markAsOpen({id:notification.notification_id!}).subscribe();
    
    if (notification.university) {
      this.router.navigate(['/university-details'], {
        queryParams: { university: JSON.stringify(notification.university) 
    }
      });
    }
    
    this.isPanelOpen = false;
  }

  // Close panel when clicking outside
  @HostListener('document:click', ['$event'])
  onDocumentClick(event: MouseEvent): void {
    const target = event.target as HTMLElement;
    const notificationPanel = document.querySelector('.notification-panel');
    const notificationBell = document.querySelector('.notification-bell');
    
    if (
      this.isPanelOpen && 
      notificationPanel && 
      notificationBell && 
      !notificationPanel.contains(target) && 
      !notificationBell.contains(target)
    ) {
      this.isPanelOpen = false;
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach(sub => sub.unsubscribe());
  }
}