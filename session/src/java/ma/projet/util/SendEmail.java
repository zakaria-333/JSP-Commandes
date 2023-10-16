/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.util;
// Java program to send email 

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    public static void sendEmail(String recipient, String subject, String messageText) {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465"); // Port sécurisé pour Gmail

        Session session = Session.getInstance(properties, null);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("zelharchi40@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);
            message.setText(messageText);

            Transport transport = session.getTransport("smtps");
            transport.connect("smtp.gmail.com", "zelharchi40@gmail.com", "kzat jqtz eaqn jadd");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("E-mail envoyé avec succès");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}
