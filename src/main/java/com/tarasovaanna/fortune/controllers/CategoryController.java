package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.models.Category;
import com.tarasovaanna.fortune.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@Controller
@RequestMapping("/admin")
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping("/categories/list")
    public String listCategories(@RequestParam(defaultValue = "") String search,
                                 @RequestParam(required = false) Long id,
                                 Model model) {
        List<Category> categories;
        if (id != null) {
            categories = categoryService.searchCategoriesById(id);
        } else if (!search.isEmpty()) {
            categories = categoryService.searchCategoriesByName(search);
        } else {
            categories = categoryService.getAllCategories();
        }

        model.addAttribute("categories", categories);
        model.addAttribute("search", search);
        model.addAttribute("id", id);

        return "categories/category-list";
    }



    @GetMapping("/categories/create")
    public String createCategoryForm(Model model) {
        model.addAttribute("category", new Category());
        return "categories/category-create";
    }

    @PostMapping("/categories/create")
    public String createCategory(@ModelAttribute Category category, Model model) {
        try {
            categoryService.saveCategory(category);
            return "redirect:/admin/categories/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "categories/category-create";
        }
    }

    @GetMapping("/categories/edit/{id}")
    public String editCategoryForm(@PathVariable Long id, Model model) {
        model.addAttribute("category", categoryService.getCategoryById(id));
        return "categories/category-edit";
    }

    @PostMapping("/categories/edit/{id}")
    public String editCategory(@PathVariable Long id, @ModelAttribute Category category, Model model) {
        try {
            categoryService.updateCategory(id, category);
            return "redirect:/admin/categories/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "categories/category-edit";
        }
    }

    @GetMapping("/categories/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return "redirect:/admin/categories/list";
    }
}
