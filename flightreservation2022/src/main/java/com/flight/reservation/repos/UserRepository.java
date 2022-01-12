package com.flight.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flight.reservation.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByEmail(String email);

}
