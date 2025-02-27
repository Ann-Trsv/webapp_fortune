package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.models.Dish;
import com.tarasovaanna.fortune.repositories.CategoryRepository;
import com.tarasovaanna.fortune.repositories.ProductRepository;
import com.tarasovaanna.fortune.services.DishService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.security.core.userdetails.UserDetails;

@Controller
@RequiredArgsConstructor
public class DishController {

    private final DishService dishService;
    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;

    @GetMapping("/dishes/list")
    public String listDishes(Model model) {
        model.addAttribute("dishes", dishService.getAllDishes());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean isAdmin = false;
        boolean isAuthenticated = false;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails userDetails) {
            isAdmin = userDetails.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"));
        }
        isAuthenticated = authentication != null && authentication.isAuthenticated() && !(authentication.getPrincipal() instanceof String);
        model.addAttribute("isAuthenticated", isAuthenticated);
        model.addAttribute("isAdmin", isAdmin);
        return "dishes/dish-list";
    }

    @GetMapping("/dishes/details/{id}")
    public String dishDetails(@PathVariable Long id, Model model) {
        Dish dish = dishService.getDishById(id);
        model.addAttribute("dish", dish);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean isAdmin = false;
        boolean isAuthenticated = false;
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails userDetails) {
            isAdmin = userDetails.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"));
        }
        isAuthenticated = authentication != null && authentication.isAuthenticated() && !(authentication.getPrincipal() instanceof String);
        model.addAttribute("isAuthenticated", isAuthenticated);
        model.addAttribute("isAdmin", isAdmin);
        return "dishes/dish-details";
    }

    @GetMapping("/admin/dishes/create")
    public String showCreateDishForm(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("products", productRepository.findAll());
        model.addAttribute("dish", new Dish());
        return "dishes/dish-create";
    }

    @PostMapping("/admin/dishes/create")
    public String createDish(
            @Valid @ModelAttribute("dish") Dish dish,
            BindingResult bindingResult,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Float caloric,
            @RequestParam(required = false) Float weight,
            @RequestParam(required = false) BigDecimal price,
            @RequestParam(value = "products", required = false) Set<Long> productIds,
            @RequestParam(value = "image", required = false) MultipartFile image,
            Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("products", productRepository.findAll());
            return "dishes/dish-create";
        }

        dishService.createDish(dish.getName(), categoryId, caloric, weight, dish.getInfo(), price, productIds, image);

        return "redirect:/dishes/list";
    }

    @GetMapping("/admin/dishes/edit/{id}")
    public String showEditDishForm(@PathVariable Long id, Model model) {
        Dish dish = dishService.getDishById(id);
        if (dish.getProducts() == null) {
            dish.setProducts(new HashSet<>()); // Инициализация пустого списка продуктов, если он null
        }
        model.addAttribute("dish", dish);
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("products", productRepository.findAll());
        return "dishes/dish-edit";
    }

    @PostMapping("/admin/dishes/edit/{id}")
    public String updateDish(
            @PathVariable Long id,
            @Valid @ModelAttribute("dish") Dish dish,
            BindingResult bindingResult,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Float caloric,
            @RequestParam(required = false) Float weight,
            @RequestParam(required = false) BigDecimal price,
            @RequestParam(value = "products", required = false) Set<Long> productIds,
            @RequestParam(value = "image", required = false) MultipartFile image,
            Model model) throws IOException {

        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", categoryRepository.findAll());
            model.addAttribute("products", productRepository.findAll());
            return "dishes/dish-edit";
        }

        dishService.updateDish(id, dish.getName(), categoryId, caloric, weight, dish.getInfo(), price, productIds, image);

        return "redirect:/dishes/list";
    }

    @GetMapping("/admin/dishes/delete/{id}")
    public String deleteDish(@PathVariable Long id) {
        dishService.deleteDish(id);
        return "redirect:/dishes/list";
    }
}
