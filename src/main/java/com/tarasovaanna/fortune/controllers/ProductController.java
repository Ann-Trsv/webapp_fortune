package com.tarasovaanna.fortune.controllers;

import com.tarasovaanna.fortune.models.Product;
import com.tarasovaanna.fortune.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class ProductController {

    private final ProductService productService;

    @GetMapping("/products/list")
    public String listProducts(@RequestParam(defaultValue = "") String search,
                               @RequestParam(required = false) Long id,
                               Model model) {
        List<Product> products;
        if (id != null) {
            products = productService.searchProductsById(id);
        } else if (!search.isEmpty()) {
            products = productService.searchProductsByName(search);
        } else {
            products = productService.getAllProducts();
        }
        model.addAttribute("products", products);
        model.addAttribute("search", search);
        model.addAttribute("id", id);
        return "products/product-list";
    }

    @GetMapping("/products/create")
    public String createProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "products/product-create";
    }

    @PostMapping("/products/create")
    public String createProduct(@ModelAttribute Product product, Model model) {
        try {
            productService.saveProduct(product);
            return "redirect:/admin/products/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "products/product-create";
        }
    }

    @GetMapping("/products/edit/{id}")
    public String editProductForm(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "products/product-edit";
    }

    @PostMapping("/products/edit/{id}")
    public String editProduct(@PathVariable Long id, @ModelAttribute Product product, Model model) {
        try {
            productService.updateProduct(id, product);
            return "redirect:/admin/products/list";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "products/product-edit";
        }
    }

    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/admin/products/list";
    }
}
