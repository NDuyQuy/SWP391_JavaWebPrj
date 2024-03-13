/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.VoucherDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Voucher;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "VoucherSelectionServlet", urlPatterns = {"/VoucherSelection"})
public class VoucherSelectionServlet extends HttpServlet {

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
            out.println("<title>Servlet VoucherSelectionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherSelectionServlet at " + request.getContextPath() + "</h1>");
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
        // Tạo một phiên bản của lớp VoucherDao
        VoucherDao voucherDao = new VoucherDao();
        
        // Lấy shopid từ request parameter (nếu cần)
        int shopId = Integer.parseInt(request.getParameter("shopId"));
        
        // Lấy danh sách voucher của shop từ VoucherDao
        List<Voucher> shopVouchers = voucherDao.getVouchersByShopId(shopId);
        
        // Lấy danh sách voucher của hệ thống theo type = 1 từ VoucherDao
        int systemVoucherType = 1;
        List<Voucher> systemVouchers = voucherDao.getVouchersByType(systemVoucherType);
        
        // Gửi danh sách voucher đến trang JSP để hiển thị
        request.setAttribute("shopVouchers", shopVouchers);
        request.setAttribute("systemVouchers", systemVouchers);
        
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
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
