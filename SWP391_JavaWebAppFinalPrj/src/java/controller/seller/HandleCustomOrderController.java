/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.OrdersDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CustomOrder;
import model.Orders;
import model.Users;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "HandleCustomOrderController", urlPatterns = {"/CustomOrderAcc"})
public class HandleCustomOrderController extends HttpServlet {

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
        String url = "custom_checkout.jsp";
        Users u = (Users) request.getSession().getAttribute("user");
        if (u == null) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (u.getRole() != 1) {
            response.sendRedirect("login.jsp");
        } else {
            int order_id = Integer.parseInt(request.getParameter("id"));
            CustomOrder co = OrdersDao.getCustomOrderById(order_id);
            String act = request.getParameter("act");
            if (act == null) {
                // act = null -> go to check out page
                if (co.getOrder().getCustomer_id() == 0) {
                    request.setAttribute("orderInfo", co);
                    request.getRequestDispatcher(url).forward(request, response);
                } else {
                    // if custom order has been 
                    response.sendRedirect("Home");
                }
            }else{
                // DO SOME THING IF REQUEST HAS PARAMETER NAME 'act'
            }
            
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
        request.setCharacterEncoding("UTF-8");
        Users u = (Users) request.getSession().getAttribute("user");
        if (u == null) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            try {
                OrdersDao.acceptCustomOrder(extractOrders(request));
            } catch (Exception ex) {
                Logger.getLogger(HandleCustomOrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
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

    private Orders extractOrders(HttpServletRequest request) {
        Orders o = null;
        int c_id = Integer.parseInt(request.getParameter("c_id"));
        int order_id = Integer.parseInt(request.getParameter("o_id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        String paymentMethod = request.getParameter("paymentMethod");
        int shipping_cost = Integer.parseInt(request.getParameter("shipCost"));
        String shippingMethod = getShippingMethod(shipping_cost);
        int total = Integer.parseInt(request.getParameter("totalPrice"));
        o = new Orders(order_id, shipping_cost, total, paymentMethod, name, phone, addr, shippingMethod);
        o.setCustomer_id(c_id);
        return o;
    }

    private String getShippingMethod(int cost) {
        switch (cost) {
            case 10000:
                return "nhanh";
            case 20000:
                return "hỏa tốc";
            case 5000:
                return "tiết kiệm";
            default:
                return null;
        }
    }
}