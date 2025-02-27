package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.repositories.UserRepository;
import com.tarasovaanna.fortune.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@Controller
public class ProfileController {

    private final UserRepository userRepository;
    private final UserService userService;

    @GetMapping("/profile")
    public String showProfilePage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        MyUser user = userRepository.findByEmail(email).orElseThrow(() -> new IllegalArgumentException("Invalid user email"));
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/profile/delete/{userId}")
    public String deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return "redirect:/logout";
    }
}
