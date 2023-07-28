package com.example.customer_support_ip.services;

import com.example.customer_support_ip.beans.MessageBean;
import com.example.customer_support_ip.dao.MessageDAO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.Serializable;
import java.util.List;
import java.util.Properties;

public class MessageService implements Serializable {

    private static final String sender = "webshopip2@gmail.com";
    private static final String password = "teldopnamflmtmjw";
    private static final String port = "587";
    private static final String host = "smtp.gmail.com";

    public MessageService() {
        // TODO Auto-generated constructor stub
    }

    public List<MessageBean> getAllMessages() {
        return MessageDAO.getAll();
    }

    public MessageBean getById(Integer id) {
        return MessageDAO.getById(id);
    }

    public void changeStatus(Integer id) {
        MessageDAO.markMessageAsRead(id);
    }

    public void sendReply(String reicipent, String answer, String question) {
        Properties properties = System.getProperties();
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(sender, password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(sender));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(reicipent));
            message.setSubject("WebShop - Customer Support Reply");
            message.setText("Reply on: " + question + '\n' + '\n' + answer);
            Transport.send(message);
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

}
