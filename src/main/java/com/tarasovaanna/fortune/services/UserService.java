package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.Role;
import com.tarasovaanna.fortune.models.TemporaryUser;
import com.tarasovaanna.fortune.repositories.RoleRepository;
import com.tarasovaanna.fortune.repositories.TemporaryUserRepository;
import com.tarasovaanna.fortune.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final TemporaryUserRepository temporaryUserRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final JavaMailSender mailSender;

    public void registerUser(TemporaryUser user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        String token = UUID.randomUUID().toString();
        user.setConfirmationToken(token);
        user.setExpirationTime(LocalDateTime.now().plusMinutes(2)); //время истечения срока действия токена
        temporaryUserRepository.save(user);

        sendConfirmationEmail(user.getEmail(), token);
    }

    public boolean confirmRegistration(String token) {
        TemporaryUser temporaryUser = temporaryUserRepository.findByConfirmationToken(token);
        if (temporaryUser != null && LocalDateTime.now().isBefore(temporaryUser.getExpirationTime())) {
            // Переместить данные в основную таблицу пользователей
            MyUser user = new MyUser();
            user.setUsername(temporaryUser.getUsername());
            user.setEmail(temporaryUser.getEmail());
            user.setPassword(temporaryUser.getPassword());
            user.setEmailVerified(true);
            Role userRole = roleRepository.findByName("USER");
            if (userRole == null) {
                userRole = new Role();
                userRole.setName("USER");
                roleRepository.save(userRole);
            }
            user.setRole(userRole);
            userRepository.save(user);
            temporaryUserRepository.delete(temporaryUser);
            return true;
        }
        return false;
    }

    private void sendConfirmationEmail(String email, String token) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(email);
        mailMessage.setSubject("Подтверждение регистрации");
        mailMessage.setText("Пожалуйста, подтвердите свою регистрацию по следующей ссылке: "
                + "http://192.168.1.88:9090/confirm?token=" + token);
        mailSender.send(mailMessage);
    }

    public boolean isUsernameTaken(String username) {
        return (userRepository.findByUsername(username).isPresent()||temporaryUserRepository.findByUsername(username).isPresent());
    }
    public boolean isEmailTaken(String email) {return (userRepository.findByEmail(email).isPresent()||temporaryUserRepository.findByEmail(email).isPresent());}
    public void deleteUser(Long userId) {userRepository.deleteById(userId);}
}

