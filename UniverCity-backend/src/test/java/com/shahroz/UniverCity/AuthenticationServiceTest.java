package com.shahroz.UniverCity;

import com.shahroz.UniverCity.Entities.Role;
import com.shahroz.UniverCity.Entities.Token;
import com.shahroz.UniverCity.Entities.User;
import com.shahroz.UniverCity.Repositories.RoleRepository;
import com.shahroz.UniverCity.Repositories.TokenRepository;
import com.shahroz.UniverCity.Repositories.UserRepository;
import com.shahroz.UniverCity.security.JwtService;
import com.shahroz.UniverCity.security.auth.AuthenticationRequest;
import com.shahroz.UniverCity.security.auth.AuthenticationResponse;
import com.shahroz.UniverCity.security.auth.AuthenticationService;
import com.shahroz.UniverCity.security.auth.RegistrationRequest;
import com.shahroz.UniverCity.security.email.EmailService;
import com.shahroz.UniverCity.security.email.EmailTemplateName;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

class AuthenticationServiceTest {

    @InjectMocks
    private AuthenticationService authenticationService;

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtService jwtService;

    @Mock
    private RoleRepository roleRepository;

    @Mock
    private EmailService emailService;

    @Mock
    private TokenRepository tokenRepository;

    @Mock
    private AuthenticationManager authenticationManager;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void register_ShouldSaveUserAndSendValidationEmail() throws Exception {
        // Arrange
        RegistrationRequest request = new RegistrationRequest("Shahroz", "Salman", "Shahroz.Salman@example.com", "password123");
        Role userRole = mock(Role.class); // Mock role object

        when(roleRepository.findByName("USER")).thenReturn(Optional.of(userRole));
        when(passwordEncoder.encode("password123")).thenReturn("encodedPassword");

        // Act
        authenticationService.register(request);

        // Assert
        ArgumentCaptor<User> userCaptor = ArgumentCaptor.forClass(User.class);
        verify(userRepository).save(userCaptor.capture());
        User savedUser = userCaptor.getValue();

        assertEquals("Shahroz", savedUser.getFirstName());
        assertEquals("Salman", savedUser.getLastName());
        assertEquals("Shahroz.Salman@example.com", savedUser.getEmail());
        assertEquals("encodedPassword", savedUser.getPassword());
        assertFalse(savedUser.isEnabled());

        verify(emailService).sendEmail(
                eq("Shahroz.Salman@example.com"),
                eq("Shahroz Salman"),
                eq(EmailTemplateName.ACTIVATE_ACCOUNT),
                eq(null),
                eq("123456"),
                eq("Account activation")
        );
    }

    @Test
    void authenticate_ShouldReturnToken_WhenCredentialsAreValid() {
        // Arrange
        AuthenticationRequest request = new AuthenticationRequest("john.doe@example.com", "password123");
        User mockUser = mock(User.class);

        Authentication authentication = mock(Authentication.class);
        when(authenticationManager.authenticate(any(UsernamePasswordAuthenticationToken.class)))
                .thenReturn(authentication);
        when(authentication.getPrincipal()).thenReturn(mockUser);
        when(jwtService.generateToken(anyMap(), eq(mockUser))).thenReturn("mockJwtToken");

        // Act
        AuthenticationResponse response = authenticationService.authenticate(request);

        // Assert
        assertNotNull(response);
        assertEquals("mockJwtToken", response.getToken());
    }

    @Test
    void activateAccount_ShouldEnableUser_WhenTokenIsValid() throws Exception {
        // Arrange
        String token = "validToken";
        User mockUser = mock(User.class);
        Token mockToken = mock(Token.class);

        when(tokenRepository.findByToken(token)).thenReturn(Optional.of(mockToken));
        when(mockToken.getExpiresAt()).thenReturn(LocalDateTime.now().plusMinutes(10));
        when(mockToken.getUser()).thenReturn(mockUser);
        when(userRepository.findById(anyLong())).thenReturn(Optional.of(mockUser));

        // Act
        authenticationService.activateAccount(token);

        // Assert
        verify(mockUser).setEnabled(true);
        verify(userRepository).save(mockUser);
        verify(mockToken).setValidatedAt(any(LocalDateTime.class));
        verify(tokenRepository).save(mockToken);
    }
}
