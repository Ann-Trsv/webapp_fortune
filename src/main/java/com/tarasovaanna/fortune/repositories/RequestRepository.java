package com.tarasovaanna.fortune.repositories;

import com.tarasovaanna.fortune.models.MyUser;
import com.tarasovaanna.fortune.models.Request;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    Page<Request> findByUser(MyUser user, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.name LIKE %:name% AND r.event.date = :date")
    Page<Request> findByNameAndDate(@Param("name") String name, @Param("date") LocalDate date, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.name LIKE %:name%")
    Page<Request> findByName(@Param("name") String name, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.date = :date")
    Page<Request> findByDate(@Param("date") LocalDate date, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.name LIKE %:name% AND r.event.date = :date AND r.user = :user")
    Page<Request> findByNameAndDateAndUser(@Param("name") String name, @Param("date") LocalDate date, @Param("user") MyUser user, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.name LIKE %:name% AND r.user = :user")
    Page<Request> findByNameAndUser(@Param("name") String name, @Param("user") MyUser user, Pageable pageable);

    @Query("SELECT r FROM Request r WHERE r.event.date = :date AND r.user = :user")
    Page<Request> findByDateAndUser(@Param("date") LocalDate date, @Param("user") MyUser user, Pageable pageable);

    List<Request> findByUser(MyUser user);
}
