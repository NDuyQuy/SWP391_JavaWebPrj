/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package email;

import com.sun.mail.imap.IMAPMessage;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.Random;

/**
 *
 * @author DELL
 */
public class SendEmail {

    private static final String SENDER_EMAIL = "swp391c02rt02@gmail.com";
    private static final String SENDER_APP_PASSWORD = "ilwv uizd snci cysb";

    private static Session getAuthenticatedMailSession(String email, String password) {
        Properties properties = new Properties();
        // Setup mail server
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.post", "587");

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        };
        Session session = Session.getInstance(properties, auth);
        return session;
    }

    public static void sendEmail(String to,String verifyCode, byte purpose) {
        //PURPOSE = 1 -> FORGOT EMAIL, PURPOSE = 2 -> REGISTRATION
        // Get system properties
        MimeMessage msg = new MimeMessage(getAuthenticatedMailSession(SENDER_EMAIL, SENDER_APP_PASSWORD));
        try {
            //Content type
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //Send from...
            msg.setFrom(SENDER_EMAIL);
            //Send to..
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //Mail Subject
            msg.setSubject(getEmailSubject(purpose));
            //Mail Text
            //Mail Content with HTML type
            msg.setContent(getMailContent(purpose,verifyCode), "text/html");

            //Send mail
            Transport.send(msg);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String generateRandomNumber(int length) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10); // Generates a random digit (0 to 9)
            sb.append(digit);
        }
        return sb.toString();
    }

    private static String getMailContent(byte purpose,String verifyCode) {
        switch (purpose) {
            case 1:
                return getForgotPasswordMailContent(verifyCode);
            case 2:
                return getRegisterMailContent(verifyCode);
        }
        return null;
    }

    private static String getRegisterMailContent(String verifyCode) {
        //SEND VERIFY CODE FOR REGISTER ACCOUNT
        String content = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <body>\n"
                + "        <h2>Welcome to CO.Handmade!</h2>\n"
                + "        <p>Thank you for registering an account with CO.Handmade. To complete your registration, please verify your email address.</p>\n"
                + "        <p>Your verification code is:</p>\n"
                + "        <h1>" + verifyCode + "</h1>\n"
                + "        <p>This code will expire in 30 minutes after this email was sent.</p>\n"
                + "        <p>Sincerely,</p>\n"
                + "        <p><b>CO.Handmade Support Team</b></p>\n"
                + "    </body>\n"
                + "</html>";
        return content;
    }

    private static String getForgotPasswordMailContent(String verifyCode) {
        //SEND VERIFY CODE FOR USERS THAT FORGOT PASSWORD
        String content = new String();
        content = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "    <body>\n"
                + "        <h2>Dear User,</h2>\n"
                + "        <p>We hope this email finds you well. You recently initiated the process to reset the password for your account on CO.Handmade.</p>\n"
                + "        <p>Your verification code is:</p>\n"
                + "        <h1>" + verifyCode + "</h1>\n"
                + "        <p>Please use this code to complete the password reset. Note that the code will expire 30 minutes after the time of this email.</p>\n"
                + "        <p>If you did not request this password reset, please contact our support team immediately.</p>\n"
                + "        <p>Thank you for your attention to this matter.</p>\n"
                + "        <p>!!IMPORTANT.IF YOU SUCCESS. The password of your account will be 123456. So please change it ASAP</p>\n"
                + "        <p>Sincerely,</p>\n"
                + "        <p><b>CO.Handmade Support Team</b></p>\n"
                + "    </body>\n"
                + "</html>";
        return content;
    }
    private static String getEmailSubject(byte purpose){
        if(purpose==1){
            return "Password Reset Request for Your CO.Handmade Account";
        }
        return "Verify Your Email for CO.Handmade Account Registration";
    }
    public static void main(String[] args) {
        sendEmail("duyquy140903@gmail.com", "1", (byte)2);
    }
}

