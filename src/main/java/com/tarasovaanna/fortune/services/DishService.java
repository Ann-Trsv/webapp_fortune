package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.Category;
import com.tarasovaanna.fortune.models.Dish;
import com.tarasovaanna.fortune.models.Product;
import com.tarasovaanna.fortune.repositories.CategoryRepository;
import com.tarasovaanna.fortune.repositories.DishRepository;
import com.tarasovaanna.fortune.repositories.ProductRepository;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@RequiredArgsConstructor
@Service
public class DishService {

    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    private final DishRepository dishRepository;

    public List<Dish> getAllDishes() {
        return dishRepository.findAll();
    }

    public Dish getDishById(Long id) {
        return dishRepository.findById(id).orElseThrow();
    }

    public boolean existsByName(String name) {
        return dishRepository.existsByName(name);
    }

    public void createDish(@NotBlank @Size(min = 2) String name,
                           Long categoryId,
                           Float caloric,
                           Float weight,
                           String info,
                           BigDecimal price,
                           Set<Long> productIds,
                           MultipartFile image) {

        Category category = null;
        if (categoryId != null) {
            category = categoryRepository.findById(categoryId).orElseThrow();
        }
        Set<Product> products = new HashSet<>();
        if (productIds != null) {
            products = new HashSet<>(productRepository.findAllById(productIds));
        }

        String imagePath = saveImage(image, name);

        Dish dish = new Dish();
        dish.setName(name);
        dish.setCategory(category);
        dish.setCaloric(caloric);
        dish.setWeight(weight);
        dish.setInfo(info);
        dish.setPrice(price);
        dish.setProducts(products);
        dish.setImagePath(imagePath);

        dishRepository.save(dish);
    }

    public Category getCategoryById(Long categoryId) {
        if (categoryId == null) {
            return null;
        }
        return categoryRepository.findById(categoryId)
                .orElseThrow(() -> new NoSuchElementException("Category with ID " + categoryId + " not found"));
    }

    public Set<Product> getProductsByIds(Set<Long> productIds) {
        return new HashSet<>(productRepository.findAllById(productIds));
    }

    public void updateDish(Long id, String name, Long categoryId, Float caloric, Float weight, String info, BigDecimal price, Set<Long> productIds, MultipartFile image) throws IOException {
        Dish dish = getDishById(id);
        Category category = getCategoryById(categoryId);
        Set<Product> products = getProductsByIds(productIds);

        if (!dish.getName().equals(name) && dishRepository.existsByName(name)) {
            throw new IllegalArgumentException("Блюдо с таким названием уже существует.");
        }

        if (image != null && !image.isEmpty()) {
            // Удаляем старое изображение
            if (dish.getImagePath() != null) {
                Path oldImagePath = Paths.get("src/main/resources/static" + dish.getImagePath());
                if (Files.exists(oldImagePath)) {
                    Files.delete(oldImagePath);
                }
            }
            // Сохраняем новое изображение
            String imagePath = saveImage(image, name);
            dish.setImagePath(imagePath);
        }

        dish.setName(name);
        dish.setCategory(category);
        dish.setCaloric(caloric);
        dish.setWeight(weight);
        dish.setInfo(info);
        dish.setPrice(price);
        dish.setProducts(products);

        dishRepository.save(dish);
    }

    public void deleteDish(Long id) {
        Dish dish = getDishById(id);
        if (dish.getImagePath() != null) {
            Path imagePath = Paths.get("src/main/resources/static" + dish.getImagePath());
            try {
                Files.deleteIfExists(imagePath);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        dishRepository.deleteById(id);
    }

    public String saveImage(MultipartFile image, String name) {
        Random rn = new Random();
        int randomNum = rn.nextInt(1000 - 1 + 1) + 1;
        if (image != null && !image.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/dishes-images/";
                String originalFilename = image.getOriginalFilename();
                String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")); // Получаем расширение файла
                String uniqueFilename = name + randomNum + fileExtension; // Генерируем имя
                String filePath = Paths.get(uploadDir, uniqueFilename).toString();
                Files.copy(image.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                return "/dishes-images/" + uniqueFilename; // Возвращаем относительный путь
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
