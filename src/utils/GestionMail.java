package utils;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GestionMail {
	private static String user = "etudiant.isi.java2@gmail.com";
	private static String pwd = "abc123...";

	private static String from = "etudiant.isi.java2@gmail.com";

	public static void sendEmail(String msg, String to, String sujet){
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {

						return new PasswordAuthentication(user, pwd);
					}
				});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(sujet);
			message.setContent(msg, "text/html; charset=utf-8");

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}	
	}
}
