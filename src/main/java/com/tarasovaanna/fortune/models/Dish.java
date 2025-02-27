package com.tarasovaanna.fortune.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.math.BigDecimal;
import java.util.Set;

@Entity
@Table(name = "dishes")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(exclude = {"products"})
@ToString(exclude = {"products"})
public class Dish {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    @NotBlank(message = "'Название блюда' не может быть пустым")
    @Size(min = 2, message = "'Название блюда' должно содержать не менее 2 символов")
    private String name;

    @ManyToOne
    @JoinColumn(nullable = true, name = "category_id")
    private Category category;

    @Column(nullable = true, columnDefinition = "REAL")
    private Float caloric;

    @Column(nullable = true, columnDefinition = "REAL")
    private Float weight;

    @Column(nullable = true, columnDefinition = "TEXT")
    private String info;

    @Column(nullable = true, columnDefinition = "DECIMAL(10, 2)")
    private BigDecimal price;

    @Column(nullable = true)
    private String imagePath;

    @JsonManagedReference
    @ManyToMany
    @JoinTable(
            name = "dish_product",
            joinColumns = @JoinColumn(name = "dish_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id")
    )
    private Set<Product> products;
}
