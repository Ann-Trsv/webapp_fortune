package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.configuration.SecurityConfig;
import com.tarasovaanna.fortune.models.Event;
import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.Request;
import com.tarasovaanna.fortune.repositories.EventRepository;
import com.tarasovaanna.fortune.repositories.MyUserRepository;
import com.tarasovaanna.fortune.repositories.RequestRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class RequestService {
    private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
    private final RequestRepository requestRepository;
    private final EventRepository eventRepository;
    private final MyUserRepository userRepository;
    private final SimpMessagingTemplate messagingTemplate;

    public Request getRequestById(Long id) {
        Optional<Request> requestOptional = requestRepository.findById(id);
        if (requestOptional.isPresent()) {
            logger.info("Request found: {}", requestOptional.get());
            return requestOptional.get();
        } else {
            logger.warn("Request not found for id: {}", id);
            return null;
        }
    }

    public String createRequest(Event event, Request request, MyUser user) {
        List<Request> userRequests = requestRepository.findByUser(user);

        for (Request existingRequest : userRequests) {
            if ((existingRequest.getConfirmation() == null) && (user.getRole().getName().equals("USER"))) {
                return "У вас есть незавершенные заявки. Пожалуйста, дождитесь их подтверждения!";
            }
        }
        if (event.getStartTime().isBefore(LocalTime.of(10, 0)) || event.getEndTime().isAfter(LocalTime.of(22, 0))) {
            return "График работы с 10:00 до 22:00!";
        }
        if (event.getEndTime().isBefore(event.getStartTime()) || event.getEndTime().isBefore(event.getStartTime().plusHours(1))) {
            return "Время окончания должно быть не менее чем через 1 час после начала!";
        }

        Event savedEvent = eventRepository.save(event);

        request.setEvent(savedEvent);
        request.setUser(user);
        request.setConfirmation(null);
        request.setComment("Заявка находится в обработке.");

        requestRepository.save(request);

        return null;
    }

    public String editRequest(Long id, Event event, Request request, MyUser user) {
        Request existingRequest = getRequestById(id);
        if (existingRequest == null) {
            return "Заявка не найдена!";
        }
        if (event.getStartTime().isBefore(LocalTime.of(10, 0)) || event.getEndTime().isAfter(LocalTime.of(22, 0))) {
            return "График работы с 10:00 до 22:00!";
        }
        if (event.getEndTime().isBefore(event.getStartTime()) || event.getEndTime().isBefore(event.getStartTime().plusHours(1))) {
            return "Время окончания должно быть не менее чем через 1 час после начала!";
        }
        if (isConfirmationNull(request.getConfirmation())) {
            request.setComment("Заявка находится в обработке.");
        }

        existingRequest.getEvent().setName(event.getName());
        existingRequest.getEvent().setDate(event.getDate());
        existingRequest.getEvent().setStartTime(event.getStartTime());
        existingRequest.getEvent().setEndTime(event.getEndTime());
        existingRequest.getEvent().setInfo(event.getInfo());
        existingRequest.setFirstName(request.getFirstName());
        existingRequest.setLastName(request.getLastName());
        existingRequest.setPatronymic(request.getPatronymic());
        existingRequest.setPhone(request.getPhone());
        existingRequest.setConfirmation(request.getConfirmation());
        existingRequest.setComment(request.getComment());

        eventRepository.save(existingRequest.getEvent());
        requestRepository.save(existingRequest);

        messagingTemplate.convertAndSend("/topic/request-status", existingRequest.getId().toString());

        return null;
    }

    public void deleteRequest(Long id) {
        Request request = requestRepository.findById(id).orElse(null);
        if (request != null) {
            requestRepository.delete(request);
            eventRepository.delete(request.getEvent());
        }
    }

    public boolean hasAccessToRequest(Authentication authentication, Request request) {
        MyUser user = userRepository.findByEmail(authentication.getName());
        return user.equals(request.getUser()) || hasRoleAdmin(authentication);
    }

    private boolean hasRoleAdmin(Authentication authentication) {
        return authentication.getAuthorities().stream()
                .anyMatch(role -> "ROLE_ADMIN".equals(role.getAuthority()));
    }

    private boolean isConfirmationNull(Boolean confirmation) {
        return confirmation == null;
    }

    public Page<Request> searchRequests(String name, LocalDate date, Pageable pageable) {
        if (name != null && !name.isEmpty() && date != null) {
            return requestRepository.findByNameAndDate(name, date, pageable);
        } else if (name != null && !name.isEmpty()) {
            return requestRepository.findByName(name, pageable);
        } else if (date != null) {
            return requestRepository.findByDate(date, pageable);
        } else {
            return requestRepository.findAll(pageable);
        }
    }

    public Page<Request> searchRequestsByUser(String name, LocalDate date, MyUser user, Pageable pageable) {
        if (name != null && !name.isEmpty() && date != null) {
            return requestRepository.findByNameAndDateAndUser(name, date, user, pageable);
        } else if (name != null && !name.isEmpty()) {
            return requestRepository.findByNameAndUser(name, user, pageable);
        } else if (date != null) {
            return requestRepository.findByDateAndUser(date, user, pageable);
        } else {
            return requestRepository.findByUser(user, pageable);
        }
    }
}
