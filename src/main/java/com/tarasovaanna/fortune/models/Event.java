package com.tarasovaanna.fortune.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "events")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "'Название мероприятия' не может быть пустым!")
    private String name;

    @NotNull(message = "'Дата' не может быть пустой!")
    @Future(message = "'Дата' должна быть в будущем времени!")
    private LocalDate date;

    @NotNull(message = "'Время начала' не может быть пустым!")
    private LocalTime startTime;

    @NotNull(message = "'Время конца' не может быть пустым!")
    private LocalTime endTime;

    private String info;

    @Transient
    private String dateString;
    @Transient
    private String startTimeString;
    @Transient
    private String endTimeString;
}
