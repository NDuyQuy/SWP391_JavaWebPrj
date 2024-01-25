/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UsersDao;
import email.SendEmail;
import model.User;
import model.VerifyCode;

/**
 *
 * @author ASUS
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/verify_registration_email.jsp";
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User u = new User(username, password, email);
        //SEND EMAIL, SOTRE USERS DATA,VERIFY CODE DATA
        request.getSession().setAttribute("registration", u);
        String verifyCode = SendEmail.generateRandomNumber(6);
        long expiredTime = System.currentTimeMillis() + 30*60*1000;
        VerifyCode code = new VerifyCode(verifyCode, expiredTime);
        request.getSession().setAttribute("verify", code);
        SendEmail.sendEmail(email, verifyCode, (byte)2);
        
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/login.jsp";
        try {
            VerifyCode realCode = (VerifyCode) request.getSession().getAttribute("verify");
            String verifyCode = request.getParameter("verify");
            long currentTime = System.currentTimeMillis();
            if(verifyCode.equals(realCode.getCode())&&currentTime<=realCode.getExpiredTime()){
                User u = (User) request.getSession().getAttribute("registration");
                UsersDao.register(u.getUserName(), u.getPassword(), u.getEmail());
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            url = "/register.jsp";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
