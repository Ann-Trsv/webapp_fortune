package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.TemporaryUser;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface TemporaryUserRepository extends JpaRepository<TemporaryUser, Long> {
    TemporaryUser findByConfirmationToken(String token);

    @Query("SELECT u FROM TemporaryUser u WHERE u.expirationTime < :now")
    List<TemporaryUser> findByExpirationTimeBefore(@Param("now") LocalDateTime now);

    Optional<TemporaryUser> findByEmail(String email);
    Optional<TemporaryUser> findByUsername(String username);
}
