package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.configuration.SecurityConfig;
import com.tarasovaanna.fortune.models.Event;
import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.Request;
import com.tarasovaanna.fortune.repositories.EventRepository;
import com.tarasovaanna.fortune.repositories.MyUserRepository;
import com.tarasovaanna.fortune.repositories.RequestRepository;
import com.tarasovaanna.fortune.services.RequestService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class RequestController {

    private final RequestRepository requestRepository;
    private final EventRepository eventRepository;
    private final MyUserRepository userRepository;
    private final RequestService requestService;
    private static final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);

    @GetMapping("/requests/create")
    public String showCreateRequestForm(Model model) {
        model.addAttribute("event", new Event());
        model.addAttribute("request", new Request());

        model.addAttribute("nameError", "");
        model.addAttribute("dateError", "");
        model.addAttribute("startTimeError", "");
        model.addAttribute("endTimeError", "");
        model.addAttribute("descriptionError", "");
        model.addAttribute("firstNameError", "");
        model.addAttribute("lastNameError", "");
        model.addAttribute("patronymicError", "");
        model.addAttribute("phoneError", "");
        model.addAttribute("error", "");

        return "requests/request-create";
    }

    @PostMapping("/requests/create")
    public String createRequest(Model model, @Valid Event event, BindingResult eventBindingResult, @Valid Request request, BindingResult requestBindingResult) {
        if (eventBindingResult.hasErrors() || requestBindingResult.hasErrors()) {
            model.addAttribute("event", event);
            model.addAttribute("request", request);

            model.addAttribute("nameError", getErrorMessage(eventBindingResult, "name"));
            model.addAttribute("dateError", getErrorMessage(eventBindingResult, "date"));
            model.addAttribute("startTimeError", getErrorMessage(eventBindingResult, "startTime"));
            model.addAttribute("endTimeError", getErrorMessage(eventBindingResult, "endTime"));
            model.addAttribute("descriptionError", getErrorMessage(eventBindingResult, "info"));
            model.addAttribute("firstNameError", getErrorMessage(requestBindingResult, "firstName"));
            model.addAttribute("lastNameError", getErrorMessage(requestBindingResult, "lastName"));
            model.addAttribute("patronymicError", getErrorMessage(requestBindingResult, "patronymic"));
            model.addAttribute("phoneError", getErrorMessage(requestBindingResult, "phone"));
            return "requests/request-create";
        }

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        MyUser user = userRepository.findByEmail(email);

        String error = requestService.createRequest(event, request, user);
        if (error != null) {
            model.addAttribute("error", error);
            return "requests/request-create";
        }

        return "redirect:/requests/list";
    }

    private String getErrorMessage(BindingResult bindingResult, String field) {
        if (bindingResult.hasFieldErrors(field)) {
            return bindingResult.getFieldError(field).getDefaultMessage();
        }
        return "";
    }

    @GetMapping("/requests/list")
    public String userRequests(Model model, @RequestParam(defaultValue = "1") int page) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MyUser user = userRepository.findByEmail(authentication.getName());
        Page<Request> requests;

        if (authentication.getAuthorities().stream()
                .anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"))) {
            requests = requestRepository.findAll(PageRequest.of(page - 1, 4));
        } else {
            requests = requestRepository.findByUser(user, PageRequest.of(page - 1, 4));
        }

        model.addAttribute("requests", requests.getContent());
        model.addAttribute("pageNumber", requests.getNumber() + 1);
        model.addAttribute("totalPages", requests.getTotalPages());
        return "requests/request-list";
    }

    @GetMapping("/requests/details/{id}")
    public String showDetailsRequestForm(@PathVariable Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Request request = requestService.getRequestById(id);

        if (request == null || !requestService.hasAccessToRequest(authentication, request)) {
            return "redirect:/requests/list";
        }

        MyUser user = userRepository.findByEmail(authentication.getName());

        model.addAttribute("isConfirmationNull", isConfirmationNull(request.getConfirmation()));
        model.addAttribute("user", user);
        model.addAttribute("request", request);
        model.addAttribute("event", request.getEvent());

        return "requests/request-details";
    }

    @GetMapping("/requests/edit/{id}")
    public String showEditRequestForm(@PathVariable Long id, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Request request = requestService.getRequestById(id);

        if (request == null || !requestService.hasAccessToRequest(authentication, request)) {
            return "redirect:/requests/list";
        }

        model.addAttribute("request", request);
        MyUser user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("isConfirmationNull", isConfirmationNull(request.getConfirmation()));
        model.addAttribute("user", user);
        model.addAttribute("event", request.getEvent());
        model.addAttribute("request", request);
        return "requests/request-edit";
    }

    @PostMapping("/requests/edit/{id}")
    public String editRequest(@PathVariable Long id, @Valid @ModelAttribute("event") Event event, BindingResult eventBindingResult, @Valid @ModelAttribute("request") Request request, BindingResult requestBindingResult, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Request existingRequest = requestService.getRequestById(id);

        if (existingRequest == null || !requestService.hasAccessToRequest(authentication, existingRequest)) {
            return "redirect:/requests/list";
        }

        if (eventBindingResult.hasErrors() || requestBindingResult.hasErrors()) {
            model.addAttribute("request", existingRequest);
            model.addAttribute("event", existingRequest.getEvent());
            model.addAttribute("dateError", getErrorMessage(eventBindingResult, "date"));
            model.addAttribute("startTimeError", getErrorMessage(eventBindingResult, "startTime"));
            model.addAttribute("endTimeError", getErrorMessage(eventBindingResult, "endTime"));
            model.addAttribute("descriptionError", getErrorMessage(eventBindingResult, "info"));
            model.addAttribute("firstNameError", getErrorMessage(requestBindingResult, "firstName"));
            model.addAttribute("lastNameError", getErrorMessage(requestBindingResult, "lastName"));
            model.addAttribute("patronymicError", getErrorMessage(requestBindingResult, "patronymic"));
            model.addAttribute("phoneError", getErrorMessage(requestBindingResult, "phone"));
            model.addAttribute("isConfirmationNull", isConfirmationNull(request.getConfirmation()));
            model.addAttribute("user", userRepository.findByEmail(authentication.getName()));
            return "requests/request-edit";
        }

        String error = requestService.editRequest(id, event, request, userRepository.findByEmail(authentication.getName()));
        if (error != null) {
            model.addAttribute("error", error);
            return "requests/request-edit";
        }

        return "redirect:/requests/list";
    }

    @PostMapping("/requests/delete/{id}")
    public String deleteRequest(@PathVariable Long id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Request request = requestService.getRequestById(id);
        if (request == null || !requestService.hasAccessToRequest(authentication, request)) {
            return "redirect:/requests/list";
        }
        requestService.deleteRequest(id);
        return "redirect:/requests/list";
    }

    private boolean isConfirmationNull(Boolean confirmation) {
        return confirmation == null;
    }

    @GetMapping("/requests/search")
    public String searchRequests(@RequestParam(required = false) String name,
                                 @RequestParam(required = false) String date,
                                 @RequestParam(defaultValue = "1") int page,
                                 Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        MyUser user = userRepository.findByEmail(authentication.getName());
        LocalDate localDate = null;
        if (date != null && !date.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            localDate = LocalDate.parse(date, formatter);
        }

        Page<Request> requests;
        if (authentication.getAuthorities().stream()
                .anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"))) {
            requests = requestService.searchRequests(name, localDate, PageRequest.of(page - 1, 4));
        } else {
            requests = requestService.searchRequestsByUser(name, localDate, user, PageRequest.of(page - 1, 4));
        }

        model.addAttribute("requests", requests.getContent());
        model.addAttribute("pageNumber", requests.getNumber() + 1);
        model.addAttribute("totalPages", requests.getTotalPages());
        model.addAttribute("name", name);
        model.addAttribute("date", date);
        return "requests/request-list";
    }
}
