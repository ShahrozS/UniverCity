import { Component, OnInit, OnDestroy, HostListener } from '@angular/core';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';
import { AuthenticationService, NotificationsService } from '../../Services/services';
import { Notification, User } from '../../Services/models';
import { faBell } from '@fortawesome/free-solid-svg-icons';
import  SockJS from 'sockjs-client';
import * as Stomp from 'stompjs';
import { TokenService } from '../../Services/token/token.service';
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
  private notificationCountSubscription :any;
  socketClient: any = null;


  //Web socket 








  constructor(
    private notificationService: NotificationsService,
    private router: Router,
    private auth: AuthenticationService,
    private tokenService: TokenService,
    
  ) {}

  ngOnInit(): void {
    // Subscribe to unread notifications count
    this.subscriptions.push(
      this.notificationService.getUnreadNotificationsCount().subscribe(count => {
        this.unreadCount = count;
      })
    );

    this.connection();



    // Get initial count
    this.notificationService.getUnreadNotificationsCount().subscribe();
    

  
  }

  private connection(){
    this.auth.getCurrentUser().subscribe(
      data =>{
        let ws = new SockJS('http://localhost:8088/api/v1/ws');
      this.socketClient = Stomp.over(ws);
      this.socketClient.connect({'Authorization:': 'Bearer ' + this.tokenService.token} , ()=>{
          console.log("Connecting to the websocket" + `${data.user_id}`);
          this.notificationCountSubscription = this.socketClient.subscribe(
            `/user/${data.user_id}/notifications`,
            (message:any)=>{
              const count = JSON.parse(message.body);
                 this.unreadCount = count.unReadCount
            }
          )
      });
      }
      )
    
     
  }

  togglePanel(): void {
    this.isPanelOpen = !this.isPanelOpen;
    
    if (this.isPanelOpen) {
      this.loadNotifications();
      this.unreadCount = 0;
      
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