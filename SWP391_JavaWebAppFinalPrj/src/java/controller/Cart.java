/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDetailDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CartDetail;
import model.Users;

/**
 *
 * @author LENOVO
 */
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
        // Lấy thông tin người dùng từ session
        Users user = (Users) request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            List<CartDetail> cart = CartDetailDao.GetCartOfUser(user.getId());
            // GROUP BY NAME
            Map<String, List<CartDetail>> cartGroup = cart.stream().collect(
                    Collectors.groupingBy(c -> c.getProduct().getShop().getShop_name())
            );
            request.setAttribute("cartGroup", cartGroup);
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
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
        Users user = (Users) request.getSession().getAttribute("user");

        if (user != null) {
            List<CartDetail> cartItems = CartDetailDao.GetCartOfUser(user.getId());

            // Process selected items
            String selectedProductIds = request.getParameter("selectedProductIds");
            if (selectedProductIds != null && !selectedProductIds.isEmpty()) {
                String[] selectedIdsArray = selectedProductIds.split(",");
                List<CartDetail> selectedItems = new ArrayList<>();

                for (String selectedId : selectedIdsArray) {
                    int productId = Integer.parseInt(selectedId);

                    for (CartDetail cartItem : cartItems) {
                        if (cartItem.getProduct().getProduct_id() == productId) {
                            selectedItems.add(cartItem);
                            break;
                        }
                    }
                }
                request.getSession().setAttribute("selectedItems", selectedItems);

                response.sendRedirect("Checkout");
            } else {

                response.sendRedirect("cart.jsp");
            }
        } else {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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