/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CartItem;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})
public class Cart extends HttpServlet {

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
            out.println("<title>Servlet Cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
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

        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<CartItem> cartItems = CartDaoImpl.getCartItems(user.getUserID());
            Map<String, List<CartItem>> groupedByShop = cartItems.stream()
                    .collect(Collectors.groupingBy(cartItem -> cartItem.getShop().getShopName()));
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartGroup", groupedByShop);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/cart.jsp");
            dispatcher.forward(request, response);
        } else {

            response.sendRedirect("login.jsp");
        }
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
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            List<CartItem> cartItems = CartDaoImpl.getCartItems(user.getUserID());

            // Process selected items
            String selectedProductIds = request.getParameter("selectedProductIds");

            if (selectedProductIds != null && !selectedProductIds.isEmpty()) {
                String[] selectedIdsArray = selectedProductIds.split(",");
                List<CartItem> selectedItems = new ArrayList<>();

                for (String selectedId : selectedIdsArray) {
                    int productId = Integer.parseInt(selectedId);

                    for (CartItem cartItem : cartItems) {
                        if (cartItem.getProduct().getProductID() == productId) {
                            selectedItems.add(cartItem);
                            break;
                        }
                    }
                }

                // Save selected items to session
                request.getSession().setAttribute("selectedItems", selectedItems);

                // Redirect to CheckoutServlet
                response.sendRedirect("Checkout");
            } else {
                // Handle the case when no items are selected
                // You can redirect or show an error message
                response.sendRedirect("cart.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
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
