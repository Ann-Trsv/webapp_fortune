package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.MyUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MyUserRepository extends JpaRepository<MyUser, Long> {
    MyUser findByEmail(String email);
    MyUser findByUsername(String username);

}