/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulti;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import java.util.*;
import java.io.*;
/**
 *
 * @author DELL
 */

//private static final String[] emailList = {"quyndde170660@fpt.edu.vn"};


public class SendEmail {
    public void sendEmail (String from, String to, String pass, String content) {
        // Get system properties
        Properties properties = new Properties();

        // Setup mail server
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.post", "587");
        
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        };
        
        Session session = Session.getInstance(properties, auth);
        
        MimeMessage msg = new MimeMessage(session);
        
        try {
            //Content type
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //Send from...
            msg.setFrom(from);
            //Send to..
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //Mail Subject
            msg.setSubject("SWP - Test verify email 1.3");
            //Mail Text
            //msg.setText("SWP - Test verify email\nCode:000000");
            
            //Mail Content with HTML
            msg.setContent(content, "text/html");
            
            
            //Send mail
            Transport.send(msg);
            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}

class Program {
    public static void main (String args[]) {
        final String from = "hungdgde170372@fpt.edu.vn";
        final String pass = "lkymlhaoddfjydlr";
        
        String to = "quyndde170660@fpt.edu.vn";
        MailContent mc = new MailContent();
        SendEmail ve = new SendEmail();
        String content = mc.resetPassword("444444");
        ve.sendEmail(from, to, pass, content);
    }
}