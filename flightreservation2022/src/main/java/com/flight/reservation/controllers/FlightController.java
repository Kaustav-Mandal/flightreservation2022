package com.flight.reservation.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.flight.reservation.entities.Flight;
import com.flight.reservation.entities.Reservation;
import com.flight.reservation.repos.FlightRepository;
import com.flight.reservation.repos.PassengerRepository;
import com.flight.reservation.repos.ReservationRepository;

@Controller
public class FlightController 
{
	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	ReservationRepository reservationRepository;
	
	@Autowired
	PassengerRepository passengerRepository;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FlightController.class);
	
	@RequestMapping("/findFlights")
	public String findFlights(@RequestParam("from") String from, @RequestParam("to") String to,
			@RequestParam("departureDate") @DateTimeFormat(pattern = "MM-dd-yyyy") Date departureDate,
			ModelMap modelMap) 
	{
		LOGGER.info("Inside findFlights() From:" + from + " TO:" + to + "Departure Date: " + departureDate);
		List<Flight> flights = flightRepository.findFlights(from, to, departureDate);
		modelMap.addAttribute("flights", flights);
		LOGGER.info("Flight Found are:" + flights);
		return "displayFlights";

	}
	
	@RequestMapping("admin/addFlight")
	public String showAddFlight() {
		return "addFlight";
	}
	
	@RequestMapping("admin/reservationList")
	public String showReservations(ModelMap modelMap) 
	{
		List<Reservation> reservations = reservationRepository.findAll();
		modelMap.addAttribute("reservations", reservations);
		return "displayReservations";
	}
	
	@RequestMapping("admin/cancelReservation")
	public String cancelReservation (@RequestParam("id") Long id, ModelMap modelMap)
	{
		reservationRepository.deleteById(id);
		List<Reservation> reservations = reservationRepository.findAll();
		modelMap.addAttribute("reservations", reservations);
		return "displayReservations";
		
	}
	
	@RequestMapping("admin/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
          
		return "redirect:/login";
	}
}
