package com.tarasovaanna.fortune.services;

import com.tarasovaanna.fortune.models.TemporaryUser;
import com.tarasovaanna.fortune.repositories.TemporaryUserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CleanupService {

    private final TemporaryUserRepository temporaryUserRepository;

    @Scheduled(fixedRate = 180000) //каждые 3 минуты
    public void cleanupExpiredTemporaryUsers() {
        LocalDateTime now = LocalDateTime.now();
        List<TemporaryUser> expiredUsers = temporaryUserRepository.findByExpirationTimeBefore(now);
        temporaryUserRepository.deleteAll(expiredUsers);
    }
}
