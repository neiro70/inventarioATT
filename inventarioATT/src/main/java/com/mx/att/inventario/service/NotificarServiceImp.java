package com.mx.att.inventario.service;

import java.util.HashMap;


import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;


public class NotificarServiceImp implements NotificarService {

	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(HashMap<String,String> parameters) {

		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(parameters.get("from"));
		message.setTo(parameters.get("to"));
		message.setSubject(parameters.get("subject"));
		message.setText(parameters.get("msg"));
		mailSender.send(message);
		
	}

}
