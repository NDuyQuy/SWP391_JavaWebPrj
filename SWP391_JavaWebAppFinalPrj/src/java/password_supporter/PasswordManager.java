/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package password_supporter;
import java.security.SecureRandom;
/**
 *
 * @author ASUS
 */
public class PasswordManager {
    private static final String UPPER_CASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String LOWER_CASE = "abcdefghijklmnopqrstuvwxyz";
    private static final String DIGITS = "0123456789";
    private static final String SPECIAL_CHARACTERS = "!@#$%^&*()-_=+[]{}|;:'\",.<>/?";
    public static String generateRandomPassword(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("Length must be greater than 0");
        }

        StringBuilder password = new StringBuilder();
        SecureRandom random = new SecureRandom();

        for (int i = 0; i < length; i++) {
            int category = random.nextInt(4);  // 0 for uppercase, 1 for lowercase, 2 for digits

            switch (category) {
                case 0:
                    password.append(UPPER_CASE.charAt(random.nextInt(UPPER_CASE.length())));
                    break;
                case 1:
                    password.append(LOWER_CASE.charAt(random.nextInt(LOWER_CASE.length())));
                    break;
                case 2:
                    password.append(DIGITS.charAt(random.nextInt(DIGITS.length())));
                    break;
                case 3:
                    password.append(SPECIAL_CHARACTERS.charAt(random.nextInt(SPECIAL_CHARACTERS.length())));
                    break;
            }
        }

        return password.toString();
    }

    public static void main(String[] args) {
        int passwordLength = 10; // Change this to your desired password length
        String randomPassword = generateRandomPassword(passwordLength);
        System.out.println("Generated Password: " + randomPassword);
    }

}
