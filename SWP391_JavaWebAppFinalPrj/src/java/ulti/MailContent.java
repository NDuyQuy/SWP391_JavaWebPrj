/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulti;

/**
 *
 * @author DELL
 */
public class MailContent {
    public String resetPassword(String verifyCode) {
        String content = new String();
        content = "<!DOCTYPE html>\n" +
                            "<html>\n" +
                            "    <body>"
                    + "<h2>Hello,</h2>"
                    + "<p>You recently took steps to reset the password for your account in CO.Handmade.</p>"
                    + "<p>Your verify code is:</p>"
                    + "<h1>" + verifyCode + "</h1>"
                    + "<p>This code will expire in 30 minutes after this email was sent.</p>"
                    + "<p>Sincerely,</p>"
                    + "<p><b>CO.Handmade Support Team</b></p>"
                    + "</body></html>";
        return content;
    }
    
    public String verifyEmail() {
        return "";
    }
    
    public String orderSuccess() {
        return "";
    }
    
}
