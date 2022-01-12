package com.flight.reservation.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.flight.reservation.entities.Reservation;


public interface ReservationRepository extends JpaRepository<Reservation, Long> 
{
	
}
