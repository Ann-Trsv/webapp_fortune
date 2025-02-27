package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.models.TemporaryUser;
import com.tarasovaanna.fortune.services.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new TemporaryUser());
        return "register";
    }

    @GetMapping("/acess-registration")
    public String showRegistrationAcessForm() {
        return "acess-registration";
    }


    @PostMapping("/register")
    public String registerUser(@Valid TemporaryUser user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            model.addAttribute("errors", errors);
            return "register";
        }
        if (userService.isUsernameTaken(user.getUsername())) {
            model.addAttribute("usernameError", "Имя пользователя уже занято!");
            return "register";
        }
        if (userService.isEmailTaken(user.getEmail())) {
            model.addAttribute("emailError", "Email уже занят!");
            return "register";
        }
        userService.registerUser(user);

        return "acess-registration";
    }

    @GetMapping("/confirm")
    public String confirmRegistration(@RequestParam String token, Model model) {
        boolean isConfirmed = userService.confirmRegistration(token);
        model.addAttribute("isConfirmed", isConfirmed);
        if (!isConfirmed) {
            model.addAttribute("message", "Недействительная ссылка подтверждения <br>или срок действия ссылки истек.");
        }
        return "confirm";
    }

}


