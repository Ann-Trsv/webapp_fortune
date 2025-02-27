package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.Product;
import com.tarasovaanna.fortune.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ProductService {

    private final ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll(Sort.by("name").ascending());
    }

    public List<Product> searchProductsByName(String name) {
        return productRepository.findByNameContainingIgnoreCase(name, Sort.by("name").ascending());
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Product> searchProductsById(Long id) {
        return productRepository.findByIdIn(Collections.singletonList(id), Sort.by("name").ascending());
    }

    public Product saveProduct(Product product) {
        String name = capitalizeFirstLetter(product.getName());
        product.setName(name);

        if (productRepository.existsByName(name)) {
            throw new IllegalArgumentException("Продукт с таким именем уже существует.");
        }
        return productRepository.save(product);
    }

    public Product updateProduct(Long id, Product product) {
        String name = capitalizeFirstLetter(product.getName());
        product.setName(name);

        Product existingProduct = getProductById(id);
        if (existingProduct == null) {
            throw new IllegalArgumentException("Продукт с таким ID не существует.");
        }

        if (!existingProduct.getName().equalsIgnoreCase(name) && productRepository.existsByName(name)) {
            throw new IllegalArgumentException("Продукт с таким именем уже существует.");
        }

        product.setId(id);
        return productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    private String capitalizeFirstLetter(String input) {
        if (input == null || input.isEmpty()) {
            return input;
        }
        return input.substring(0, 1).toUpperCase() + input.substring(1).toLowerCase();
    }
}
