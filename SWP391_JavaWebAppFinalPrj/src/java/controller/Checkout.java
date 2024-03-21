/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.VouchersDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import model.*;
import java.util.stream.Collectors;
/**
 *
 * @author ASUS
 */
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {

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
        Users user = (Users) request.getSession().getAttribute("user");
        List<CartDetail> selectedItems = (List<CartDetail>) request.getSession().getAttribute("selectedItems");

        if (selectedItems != null && !selectedItems.isEmpty()) {

            Map<String, List<CartDetail>> cartGroup = selectedItems.stream().collect(
                    Collectors.groupingBy(c->c.getProduct().getShop().getShop_name())
            );
            
            Map<List<Vouchers>,List<CartDetail>> newCartGroup = new HashMap<>();
            for (Map.Entry<String, List<CartDetail>> entry : cartGroup.entrySet()) {
            String shopName = entry.getKey();
            //GET THE SHOP ITEM
            List<CartDetail> shopItems = entry.getValue();
            // Lấy danh sách voucher của cửa hàng
            List<Vouchers> vouchers = VouchersDao.getVouchersByCondition(shopName);
            
            newCartGroup.put(vouchers, shopItems);
            }
            
            request.setAttribute("selectedItems", selectedItems);
            request.setAttribute("cartGroup", newCartGroup);
            
            // Tiếp tục xử lý trang Checkout
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            
            // Iterate over the vouchers list
            

        } else {
            // Xử lý trường hợp không có sản phẩm nào được chọn
            // Có thể điều hướng hoặc hiển thị thông báo lỗi
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

}
