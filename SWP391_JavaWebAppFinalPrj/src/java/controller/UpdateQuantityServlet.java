/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartDetail;
import model.Users;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "UpdateQuantityServlet", urlPatterns = {"/UpdateQuantityServlet"})
public class UpdateQuantityServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet UpdateQuantityServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateQuantityServlet at " + request.getContextPath() + "</h1>");
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
        Users user = (Users) request.getSession().getAttribute("user");

        int userId = user.getId();

        int productId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        CartDao cartDao = new CartDao();
// Kiểm tra nếu action là "decrease" và quantity đã là 0, thì xóa sản phẩm khỏi giỏ hàng
        if ("decrease".equals(action)) {
            int newQuantity = cartDao.getCartItemQuantity(userId, productId) - 1;
            if (newQuantity <= 0) {
                cartDao.removeFromCart(userId, productId);
            } else {
                cartDao.updateCartItemQuantity(userId, productId, -1);
            }
        } else if ("increase".equals(action)) {
            cartDao.updateCartItemQuantity(userId, productId, 1);
        } else if ("remove".equals(action)) {
            cartDao.removeFromCart(userId, productId);
        } else if ("update".equals(action)) {
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            if (newQuantity <= 0) {
                cartDao.removeFromCart(userId, productId);
            } else {
                cartDao.updateNewCartItemQuantity(userId, productId, newQuantity);
            }
        }

        response.sendRedirect("Cart");

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

        processRequest(request, response);
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