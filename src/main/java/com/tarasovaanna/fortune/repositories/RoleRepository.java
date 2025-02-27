package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
