//package tw.group5.marketSeller;
//
//import java.util.Properties;
//
//import javax.mail.Authenticator;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//public class sendMoreMail {
//	public sendMoreMail(String[] member_email,String member_title,String email_content) {
//
//		// 創建JavaMail
//		String host = "smtp.gmail.com";
//		int port = 587;
//		final String username = "iii.seminar5@gmail.com";
//		final String password = "seminar5!";
//
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.port", port);
//		Session mailSessiona = Session.getInstance(props, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		});
//
//		try {
//
//			Message message = new MimeMessage(mailSessiona);
//			message.setFrom(new InternetAddress("iii.seminar5@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member_email));
//			message.setSubject(member_title);
//			message.setContent(email_content,"text/html;charset=utf-8");
//
//			Transport transport = mailSessiona.getTransport("smtp");
//			transport.connect(host, port, username, password);
//
//			Transport.send(message);
//
//			System.out.println("寄送email結束.");
//		} catch (MessagingException e) {
//			throw new RuntimeException(e);
//		}
//	}
//}
