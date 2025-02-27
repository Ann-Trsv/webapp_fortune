package com.tarasovaanna.fortune.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Set;

@Entity
@Table(name = "temporary_users")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TemporaryUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "'Имя пользователя' не может быть пустым!")
    @Size(min = 3, max = 50, message = "'Имя пользователя' должно быть от 3 до 50 символов!")
    private String username;

    @NotEmpty(message = "'Почта' не может быть пустой!")
    @Email(message = "Некорректный формат почты!")
    private String email;

    @NotEmpty(message = "'Пароль' не может быть пустым!")
    @Size(min = 8, message = "'Пароль' должен быть не менее 8 символов!")
    private String password;

    @Column(name = "confirmation_token")
    private String confirmationToken;

    @Column(name = "expiration_time")
    private LocalDateTime expirationTime;
}
