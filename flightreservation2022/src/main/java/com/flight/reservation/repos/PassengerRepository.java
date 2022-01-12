package com.flight.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flight.reservation.entities.Passenger;


public interface PassengerRepository extends JpaRepository<Passenger, Long> {

}
