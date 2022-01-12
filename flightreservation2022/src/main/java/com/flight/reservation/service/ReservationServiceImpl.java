package com.flight.reservation.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flight.reservation.entities.Flight;
import com.flight.reservation.entities.Passenger;
import com.flight.reservation.entities.Reservation;
import com.flight.reservation.entities.ReservationRequest;
import com.flight.reservation.repos.FlightRepository;
import com.flight.reservation.repos.PassengerRepository;
import com.flight.reservation.repos.ReservationRepository;
import com.flight.reservation.util.EmailUtil;
import com.flight.reservation.util.PDFGenerator;


@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	FlightRepository flightRepository;

	@Autowired
	PassengerRepository passengerRepository;

	@Autowired
	ReservationRepository reservationRepository;
	
	@Autowired
	PDFGenerator pdfGenerator;

	@Autowired
	EmailUtil emailUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReservationServiceImpl.class);

	
	@Override
	@Transactional
	public Reservation bookFlight(ReservationRequest request) {

		// Make Payment

		LOGGER.info("Inside bookFlight()");
		Long flightId = request.getFlightId();
		LOGGER.info("Fetching  flight for flight id:" + flightId);
		Flight flight = flightRepository.findById(flightId).get();

		Passenger passenger = new Passenger();
		passenger.setFirstName(request.getPassangerFirstName());
		passenger.setLastName(request.getPassengerLastName());
		passenger.setPhone(request.getPassengerPhone());
		passenger.setEmail(request.getPassengerEmail());
		Passenger savedPassenger = passengerRepository.save(passenger);

		Reservation reservation = new Reservation();
		reservation.setFlight(flight);
		reservation.setPassenger(savedPassenger);
		reservation.setCheckedIn(false);

		LOGGER.info("Saving the reservation:" + reservation);
		Reservation savedReservation = reservationRepository.save(reservation);
		
//		String filePath = "G:\\Udemy\\ReservationPDF\\" + savedReservation.getId() + ".pdf";
//		LOGGER.info("Generating  the itinerary"+filePath);
//		pdfGenerator.generateItinerary(savedReservation, filePath);
//		LOGGER.info("Emailing the Itinerary");
//		emailUtil.sendItinerary(passenger.getEmail(), filePath);

		return savedReservation;
	}

}
