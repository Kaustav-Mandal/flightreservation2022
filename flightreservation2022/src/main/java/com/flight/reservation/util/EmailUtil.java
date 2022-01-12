package com.flight.reservation.util;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailUtil {
	
	private String CheckIn = "http://localhost:9090/flightcheckin/showStartCheckin";
	private String EMAIL_BODY_ITINERARY = "PFA Itinerary. Use the below link to check In " +"\n" + CheckIn;
	private String EMAIL_BODY_PASSWORD = "Your Password to login.";

	private String EMAIL_SUBJECT_ITINERARY = "Itinerary for your Flight and Check In Link";
	private String EMAIL_SUBJECT_PASSWORD = "Password For Flight Registration";

//	private static final Logger LOGGER = LoggerFactory.getLogger(EmailUtil.class);
	
	@Autowired
	private JavaMailSender sender;

	public void sendItinerary(String toAddress, String filePath) 
	{
//		LOGGER.info("Inside sendItinerary()");
		MimeMessage message = sender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true);
			messageHelper.setTo(toAddress);
			messageHelper.setSubject(EMAIL_SUBJECT_ITINERARY);
			messageHelper.setText(EMAIL_BODY_ITINERARY);
			messageHelper.addAttachment("Itinearary", new File(filePath));
			sender.send(message);
		} catch (MessagingException e) {
		}
	}
	
	public void sendPassword(String toAddress, String password) 
	{
//		LOGGER.info("Inside sendItinerary()");
		MimeMessage message = sender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, false);
			messageHelper.setTo(toAddress);
			messageHelper.setSubject(EMAIL_SUBJECT_PASSWORD);
			messageHelper.setText(EMAIL_BODY_PASSWORD+"\n"+password);
			sender.send(message);
		} catch (MessagingException e) {
		}
	}

}
