package com.flight.reservation.util;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailUtil {
	
	@Value("${com.flight.checkin.application}")
	private String CHECKIN;
	@Value("${com.flight.checkin.application}")
	private String EMAIL_BODY_ITINERARY;
	@Value("${com.flight.checkin.application}")
	private String EMAIL_BODY_PASSWORD;

	@Value("${com.flight.reservation.itinerary.email.subject}")
	private String EMAIL_SUBJECT_ITINERARY;
	@Value("${com.flight.reservation.password.email.subject}")
	private String EMAIL_SUBJECT_PASSWORD;

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
			messageHelper.setText(EMAIL_BODY_ITINERARY + "\n" + CHECKIN);
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
