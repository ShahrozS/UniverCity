package com.shahroz.UniverCity.Entities;


import com.shahroz.UniverCity.University.University;
import com.shahroz.UniverCity.University.UniversityReview;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
@Table(name = "app_user")
@EntityListeners(AuditingEntityListener.class)
public class User implements UserDetails, Principal {


    @Id
    @GeneratedValue
    private long user_id;

    private String Username;
    private String firstName;
    private String lastName;

    @Column(unique = true)
    private String email;

    private String password;

    private boolean accountLocked;
    private boolean enabled;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Role> roles;

    @CreatedDate
    @Column(nullable = false , updatable = false)
    private LocalDateTime createdDate;

    @LastModifiedDate
    @Column(insertable = false)
    private LocalDateTime lastModifiedData;

    //relationship

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "academicscore_id", referencedColumnName = "academicscore_id")
    private AcademicScore academicScore;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "universityreview_id", referencedColumnName = "universityreview_id")
    private UniversityReview universityreview;


    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Notification> notifications;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_favorites", // Name of the join table
            joinColumns = @JoinColumn(name = "user_id"), // Foreign key in join table for User
            inverseJoinColumns = @JoinColumn(name = "university_id")
    )
    private Set<University> favoriteUniversities;

    @OneToMany(mappedBy = "user",fetch = FetchType.EAGER)
    private List<UserLocation> userLocations;


    @Override
    public String getName() {
        return email;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.roles
                .stream()
                .map(r->new SimpleGrantedAuthority(r.getName()))
                .collect(Collectors.toList());
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return !accountLocked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
return true;
    }

    @Override
    public boolean isEnabled() {
return enabled;
    }


    public String fullName(){
        return firstName + " " + lastName;
    }


    // preferenceID



//================================for o auth-=


}
