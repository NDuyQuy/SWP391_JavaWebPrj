/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDetailDao;
import dao.OrdersDao;
import dao.ProductDao;
import dao.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Orders;
import model.Users;

/**
 *
 * @author hien
 */
public class ShippingUnitController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShippingUnitController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShippingUnitController at " + request.getContextPath() + "</h1>");
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
        try {
            request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
            Users su = (Users) session.getAttribute("user");
            ArrayList<Orders> wait_list = OrdersDao.getOrdersByUnitId(su.getId(), "chờ shipping unit xác nhận");
            ArrayList<Orders> take_list = OrdersDao.getOrdersByUnitId(su.getId(), "đơn hàng đang được chuyển cho shippingunit");
            ArrayList<Orders> ship_list = OrdersDao.getOrdersByUnitId(su.getId(), "đang vận chuyển");

            if(wait_list.isEmpty()) session.setAttribute("wait_list", null);
            else session.setAttribute("wait_list", wait_list);
            if(take_list.isEmpty()) session.setAttribute("take_list", null);
            else session.setAttribute("take_list", take_list);
            if(ship_list.isEmpty())session.setAttribute("ship_list", null);
            else session.setAttribute("ship_list", ship_list);
            
            UsersDao ud = new UsersDao();
            ProductDao pd = new ProductDao();
            OrderDetailDao odd = new OrderDetailDao();
            session.setAttribute("usersDao", ud);
            session.setAttribute("productDao", pd);
            session.setAttribute("orderDetailDao", odd);
            request.getRequestDispatcher("sh_unit_order.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
        try {
            request.setCharacterEncoding("utf-8");
            HttpSession session = request.getSession();
            Users su = (Users) session.getAttribute("user");
            int id = Integer.parseInt(request.getParameter("id"));
            String action = request.getParameter("action");
            switch (action) {
                case "accept":
                    OrdersDao.updateOrderStatus(id, "đơn hàng đang được chuyển cho shippingunit");
                    break;
                case "refuse":
                    OrdersDao.updateOrderStatus(id, "chờ người bán xác nhận-shipping unit từ chối");
                    break;
                case "update":
                    OrdersDao.updateOrderStatus(id, "đang vận chuyển");
                    break;
                case "complete":
                    OrdersDao.updateOrderStatus(id, "đã giao hàng");
                    break;
            }
            
            response.sendRedirect("ShippingUnit");
        } catch (Exception ex) {
            ex.printStackTrace();
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
