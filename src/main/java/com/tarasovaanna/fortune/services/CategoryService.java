package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.Category;
import com.tarasovaanna.fortune.repositories.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

import org.springframework.data.domain.Sort;

@RequiredArgsConstructor
@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public List<Category> getAllCategories() {
        return categoryRepository.findAll(Sort.by("name").ascending());
    }

    public List<Category> searchCategoriesByName(String name) {
        return categoryRepository.findByNameContainingIgnoreCase(name, Sort.by("name").ascending());
    }

    public List<Category> searchCategoriesById(Long id) {
        return categoryRepository.findByIdIn(Collections.singletonList(id), Sort.by("name").ascending());
    }

    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    public Category saveCategory(Category category) {
        if (categoryRepository.existsByName(category.getName())) {
            throw new IllegalArgumentException("Категория с таким именем уже существует.");
        }
        return categoryRepository.save(category);
    }

    public Category updateCategory(Long id, Category category) {
        Category existingCategory = getCategoryById(id);
        if (existingCategory == null) {
            throw new IllegalArgumentException("Категория с таким ID не существует.");
        }

        if (!existingCategory.getName().equalsIgnoreCase(category.getName()) && categoryRepository.existsByName(category.getName())) {
            throw new IllegalArgumentException("Категория с таким именем уже существует.");
        }

        category.setId(id);
        return categoryRepository.save(category);
    }

    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }
}
