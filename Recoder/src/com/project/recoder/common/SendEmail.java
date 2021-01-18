package com.project.recoder.common;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
 
	//이메일 보내기
	public void Email(String email) {
		int result = 0;
	
  String host     = "smtp.gmail.com";
  final String user   = "id";
  final String password  = "pw";

  String to     = email;

  
  // Get the session object
  Properties prop = new Properties();
  prop.put("mail.smtp.host", host);
  prop.put("mail.smtp.auth", "true");
  prop.put("mail.smtp.starttls.enable", "true");

  Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(user, password);
   }
  });

  // Compose the message
  try {
   MimeMessage message = new MimeMessage(session);
   message.setFrom(new InternetAddress(user));
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

   // Subject
   message.setSubject("[내방] 비밀번호 찾기 인증");
   
   // Text
   
   message.setText(random());

   // send the message
   Transport.send(message);
   System.out.println("이메일 전송 성공");

  } catch (MessagingException e) {
   e.printStackTrace();
  }
  
  
 
  
	}
	
	//랜덤 6숫자
	public String random() {
		String result = "";
		
		int random = (int)(Math.random()*10 +1); //99999
		
		for(int i=0; i<6; i++) {
			result += random;
		}
		
		return result;
		
	}
}
	
