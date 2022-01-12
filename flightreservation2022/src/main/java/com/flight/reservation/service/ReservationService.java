package com.flight.reservation.service;

import com.flight.reservation.entities.Reservation;
import com.flight.reservation.entities.ReservationRequest;

public interface ReservationService {
	
	public Reservation bookFlight(ReservationRequest request);

}
