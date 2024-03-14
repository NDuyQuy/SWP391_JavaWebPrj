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
import model.*;
import dao.*;
/**
 *
 * @author ASUS
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String url = "";
        String username = "", password="";
        try {
            username = request.getParameter("username");
            password = request.getParameter("password");
            if(UsersDao.checkLogin(username, password)){
                // get full name, address, phone, email and role of the user
                Users u = UsersDao.getUserInfoByUsername(username);
                // set password
                u.setPassword(password);
                // add user into session scope
                request.getSession().setAttribute("user", u);
                int role = u.getRole();
                //switch the url 
                switch (role) {
                    case 1:
                        url = "/home.jsp";
                        break;
                    case 2:
                        url = "/home.jsp";
                        Shops shop = SellersDao.getShopById(u.getId());
                        request.getSession().setAttribute("shop", shop);
                        break;
                    case 3:
                        request.getSession().setAttribute("Admin", 1);
                        url = "/AdminMainpage.jsp";
                        break;
                    default:
                        url = "/home.jsp";
                } 
            }else{
                request.setAttribute("login_error", "Tên tài khoản của bạn hoặc Mật khẩu không đúng, vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            String msg = e.getMessage();
        }
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
