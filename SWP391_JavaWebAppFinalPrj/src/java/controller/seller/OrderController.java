/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.OrdersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "OrderController", urlPatterns = {"/ordercontroller"})
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        LocalDate date = LocalDate.now();
        int daysInMonth;
        try {
            String time[] = request.getParameter("month_year").split("-");
            int year = Integer.parseInt(time[0]);
            int month = Integer.parseInt(time[1]);
            date = date.withMonth(month);
            date.withYear(year);
            daysInMonth = LocalDate.of(year, month, 1).lengthOfMonth();
        } catch (Exception e) {
            int m = date.getMonthValue();
            int y = date.getYear();
            daysInMonth = LocalDate.of(y, m, 1).lengthOfMonth();
        }
        Map<Integer, Integer> orderCounts = OrdersDao.getOrdersCountADateInMonth(1, 2,date.getYear());
        request.setAttribute("dim", daysInMonth);
        StringBuilder json = new StringBuilder("[");
        for (Map.Entry<Integer, Integer> entry : orderCounts.entrySet()) {
            json.append("{");
            json.append("\"x\":").append(entry.getKey()).append(",");
            json.append("\"y\":").append(entry.getValue());
            json.append("},");
        }
        if (!orderCounts.isEmpty()) {
            json.deleteCharAt(json.length() - 1); // Remove the last comma
        }
        json.append("]");
        // Set JSON data as request attribute
        request.setAttribute("jsonData", json.toString());
        //GO TO JSP TO DISPLAY CHART
        request.getRequestDispatcher("seller/order_chart_demo.jsp").forward(request, response);

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
