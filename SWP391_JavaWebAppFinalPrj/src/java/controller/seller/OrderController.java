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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
        try {
            int shop_id = ((Users) request.getSession().getAttribute("user")).getId();
            LocalDate date = LocalDate.now();
            int daysInMonth;
            String month_year = request.getParameter("month_year");
            if (month_year != null) {
                String time[] = month_year.split("-");
                int year = Integer.parseInt(time[0]);
                int month = Integer.parseInt(time[1]);
                date = LocalDate.of(year, month, 1);
                daysInMonth = date.lengthOfMonth();
            } else {
                daysInMonth = LocalDate.of(date.getYear(), date.getMonthValue(), 1).lengthOfMonth();
            }
            Map<Integer, Integer> orderCounts = OrdersDao.getOrdersCountADateInMonth(shop_id, date.getMonthValue(), date.getYear());
            // Set JSON data as request attribute
            request.setAttribute("month", date);
            request.setAttribute("dim", daysInMonth);
            request.setAttribute("jsonData", getCharValueJsonString(orderCounts));
            request.setAttribute("statistics", getStatistic(date, shop_id));
            //GO TO JSP TO DISPLAY CHART
            request.getRequestDispatcher("seller/order_chart_demo.jsp").forward(request, response);
        } catch (NullPointerException e) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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

    private String getCharValueJsonString(Map<Integer, Integer> orderCounts) {
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
        return json.toString();
    }
    
    private ArrayList<Integer> getStatistic(LocalDate date, int shop_id){
        ArrayList<Integer> statisticList = new ArrayList<>();
        //ADD TOTAL REVENUE
        int ttRev = OrdersDao.getTotalRevenueInAMonthOfShop(shop_id, date.getMonthValue(), date.getYear());
        statisticList.add(ttRev);
        //ADD TOTAL ORDERS COUNT
        int ttOrd = OrdersDao.getOrdersCountInAMonthOfShop(shop_id, date.getMonthValue(), date.getYear());
        statisticList.add(ttOrd);
        //ADD AVERAGE REVENUE
        Integer avg = 0;
        try {
            avg = ttRev/ttOrd;
        } catch (Exception e) {
        }
        statisticList.add(avg);
        //ADD TOTAL COUNT OF SELLED PRODUCT
        statisticList.add(OrdersDao.getTotalProductSell(shop_id, date.getMonthValue(), date.getYear()));
        return statisticList;
    }
}
