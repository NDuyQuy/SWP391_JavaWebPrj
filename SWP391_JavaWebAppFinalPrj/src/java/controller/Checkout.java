/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDao;
import dao.CartDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author LENOVO
 */
public class Checkout extends HttpServlet {
private final CartDao cartDao = new CartDaoImpl();

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
            out.println("<title>Servlet Checkout</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Checkout at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Lấy danh sách sản phẩm đã chọn từ giỏ hàng
        List<CartItem> selectedItems = cartDao.getCheckedItems(user.getUserID());

        // Tạo đơn hàng mới
        Order order = createOrder(user, selectedItems);

        // Lưu đơn hàng vào database (hoặc bạn có thể chuyển nó đến một service để xử lý)
        // orderService.saveOrder(order);

        // Hiển thị đơn hàng trên trang checkout
        session.setAttribute("checkoutOrder", order);
        response.sendRedirect("checkout.jsp");
    }
private Order createOrder(User user, List<CartItem> selectedItems) {
        // Tạo đơn hàng mới
        Order order = new Order();
        order.setUser(user);
        order.setOrderDate(LocalDate.now());
        // Thêm các sản phẩm đã chọn vào đơn hàng
        for (CartItem cartItem : selectedItems) {
            OrderDetail orderDetail = new OrderDetail(order, cartItem.getProduct(), cartItem.getQuantity());
            order.addOrderDetail(orderDetail);
        }
        return order;
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
