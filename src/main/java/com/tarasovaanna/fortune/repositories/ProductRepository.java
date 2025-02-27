package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.Category;
import com.tarasovaanna.fortune.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByNameContainingIgnoreCase(String name, Sort sort);
    boolean existsByName(String name);
    List<Product> findByIdIn(List<Long> ids, Sort sort);
}
