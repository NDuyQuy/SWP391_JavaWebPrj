/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.OrdersDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Users;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "OrderDetail", urlPatterns = {"/OrderDetail"})
public class OrderDetailController extends HttpServlet {

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
            out.println("<title>Servlet OrderDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath() + "</h1>");
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
        Users u = (Users) request.getSession().getAttribute("user");
        if(u==null){
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            String order_idString = request.getParameter("id");
            if(order_idString==null) {
                request.getRequestDispatcher("seller/handle_waiting.jsp").forward(request, response);
            }
            else{
                int order_id = Integer.parseInt(order_idString);
                request.setAttribute("wod", OrdersDao.getOrderDetail(order_id));
                request.setAttribute("sunits", OrdersDao.getLocalShippingUnits(u.getAddress()));
                request.getRequestDispatcher("seller/waiting_order_detail.jsp").forward(request, response);
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
        if(u==null){
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            String act = request.getParameter("act");
            if(act.equals("acc")){
                int order_id = Integer.parseInt(request.getParameter("orderId"));
                int unit_id = Integer.parseInt(request.getParameter("unit"));
                OrdersDao.acceptOrder(unit_id, order_id);
                request.getSession().setAttribute("noti", OrdersDao.getWaitingOrders(u.getId()));
                request.getRequestDispatcher("seller/handle_waiting.jsp").forward(request, response);
            }else if(act.equals("dec")){
                int order_id = Integer.parseInt(request.getParameter("orderId"));
                String reason = request.getParameter("reason");
                if(reason.equals("other")){
                    String otherReason = request.getParameter("otherReason");
                    OrdersDao.cancelOrders(order_id, otherReason);
                }else{
                    OrdersDao.cancelOrders(order_id, reason);
                }
                request.getSession().setAttribute("noti", OrdersDao.getWaitingOrders(u.getId()));
                request.getRequestDispatcher("seller/handle_waiting.jsp").forward(request, response);
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

}
