package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
}
