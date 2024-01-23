/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import email.SendEmail;
import model.*;
/**
 *
 * @author ASUS
 */
public class VerifyEmailController extends HttpServlet {

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
            out.println("<title>Servlet VerifyEmailController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyEmailController at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        User u = UsersDao.getUserInfoByEmail(email);
        //CHECK IF USERS ENTER EMAIL THAT NOT THE EMAIL REGISTER
        if(u==null){
            request.setAttribute("error", "Your Email Is Not Correct");
            request.getRequestDispatcher("/forgotpassword.jsp").forward(request, response);
            return;
        }
        request.getSession().setAttribute("user",u);
        String verifyCode = SendEmail.generateRandomNumber(6);
        //PURPOSE 1 = FORGOT EMAIL CONTENT, 2 = REGISTER EMAIL CONTENT
        SendEmail.sendEmail(email, verifyCode, (byte)1);
        //CURENTTIME RETURN TIME IN MILISECOND, + 30 MIN IN MILISECOND -> EXPIRED TIME
        long expiredTime = System.currentTimeMillis()+(30*60*1000);
        VerifyCode code = new VerifyCode(verifyCode, expiredTime);
        //STORE CODE IN SESSION
        request.getSession().setAttribute("verifyCode", code);
        request.getRequestDispatcher("/verifyemail.jsp").forward(request, response);
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
        String verifyCode = request.getParameter("verify");
        VerifyCode realCode = (VerifyCode) request.getSession().getAttribute("verifyCode");
        String url = "/verifyemail.jsp";
        if(verifyCode.equals(realCode.getCode())){
            long currentTime = System.currentTimeMillis();
            if(currentTime>=realCode.getExpiredTime()) request.setAttribute("error", "Your VerifyCode Is Expired");
            else
            {
                User u = (User) request.getSession().getAttribute("user");
                UsersDao.resetPassword(u.getEmail());
                url = "/login.jsp";
            }
        }else{
            request.setAttribute("error", "Your VerifyCode Is Not Correct");
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