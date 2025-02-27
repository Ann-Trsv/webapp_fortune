package com.tarasovaanna.fortune.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "requests")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    private Event event;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private MyUser user;

    @Column(nullable = true)
    private Boolean confirmation;

    @Column(nullable = true)
    private String comment;

    @NotEmpty(message = "'Имя' не может быть пустым!")
    @Column(name = "first_name")
    private String firstName;

    @NotEmpty(message = "'Фамилия' не может быть пустой!")
    @Column(name = "last_name")
    private String lastName;

    @NotEmpty(message = "'Отчество' не может быть пустым!")
    @Column(name = "patronymic")
    private String patronymic;

    @NotEmpty(message = "'Телефон' не может быть пустым!")
    private String phone;
}
