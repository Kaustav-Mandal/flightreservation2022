package com.flight.reservation.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.flight.reservation.entities.Flight;
import com.flight.reservation.entities.Reservation;
import com.flight.reservation.entities.ReservationRequest;
import com.flight.reservation.repos.FlightRepository;
import com.flight.reservation.service.ReservationService;


@Controller
public class ReservationController {

	@Autowired
	FlightRepository flightRepository;

	@Autowired
	ReservationService reservationService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReservationController.class);

	
	@RequestMapping("/showCompleteReservation")
	public String showCompleteReservation(@RequestParam("flightId") Long flightId, ModelMap modelMap) 
	{
		Flight flight = flightRepository.findById(flightId).get();
		modelMap.addAttribute("flight", flight);
		LOGGER.info("Flight is:" + flight);
		return "completeReservation";

	}

	@RequestMapping(value = "/completeReservation", method = RequestMethod.POST)
	public String completeReservation(ReservationRequest request, ModelMap modelMap) 
	{
		LOGGER.info("completeReservation()  " + request);
		Reservation reservation = reservationService.bookFlight(request);
		modelMap.addAttribute("msg", "Reservation created successfully and the id is " + reservation.getId());
		return "reservationConfirmation";

	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
          
		return "redirect:/login";
	}

}
