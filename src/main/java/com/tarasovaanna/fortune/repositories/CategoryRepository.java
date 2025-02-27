package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.springframework.data.domain.Sort;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    List<Category> findByNameContainingIgnoreCase(String name, Sort sort);
    boolean existsByName(String name);
    List<Category> findByIdIn(List<Long> ids, Sort sort);
}
