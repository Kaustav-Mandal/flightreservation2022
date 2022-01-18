package com.flight.reservation.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.flight.reservation.entities.Flight;
import com.flight.reservation.entities.User;
import com.flight.reservation.repos.FlightRepository;
import com.flight.reservation.repos.UserRepository;
import com.flight.reservation.service.SecurityService;
import com.flight.reservation.util.EmailUtil;

@Controller
public class UserController 
{
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	FlightRepository flightRepository;
	
	@Autowired
	private SecurityService securityService;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	EmailUtil emailUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping("/registration")
	public String showRegistration(@ModelAttribute("user") User user)
	{
		return "registerUser";
	}
	
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) 
	{
		LOGGER.info("Inside register()" + user);
//		Random rand = new Random();
//		int int_random = rand.nextInt(999);
//		String newPassWord = user.getPassword()+int_random;
//		emailUtil.sendPassword(user.getEmail(), newPassWord);
//		user.setPassword(newPassWord);
		user.setPassword(encoder.encode(user.getPassword()));
		userRepository.save(user);
		
		
		return "login";
	} 
	
	@RequestMapping("/login")
	public String login()
	{
		LOGGER.info("Inside Login Page()");
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap) 
	{
		boolean loginResponse = securityService.login(email, password);
		LOGGER.info("Inside login() and the email is: " + email);
		if (loginResponse) 
		{
			List<Flight> flights = flightRepository.findAll();
			modelMap.addAttribute("flights", flights);
			return "findFlights";
		} else 
		{
			modelMap.addAttribute("msg", "Invalid user name or password .Please try again.");
			return "login";
		}

	}
	
}
