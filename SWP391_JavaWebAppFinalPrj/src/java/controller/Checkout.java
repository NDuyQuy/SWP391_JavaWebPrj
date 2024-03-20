/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDao;
import dao.CartDao;
import dao.SellersDao;
import dao.VoucherDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CartDetail;
import model.Shops;
import model.Users;
import model.Vouchers;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Checkout", urlPatterns = {"/Checkout"})
public class Checkout extends HttpServlet {

    private final CartDao cartDao = new CartDao();
    private final VoucherDao voucherDao = new VoucherDao();

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

            //Map<String, List<CartDetail>> groupedByShop = selectedItems.stream().collect(Collectors.groupingBy(cartItem -> cartItem.getShop().getShop_name()));

            /*for (Map.Entry<String, List<CartDetail>> entry : groupedByShop.entrySet()) {
            String shopName = entry.getKey();
            List<CartDetail> shopItems = entry.getValue();
            
            // Lấy danh sách voucher của cửa hàng
            List<Vouchers> vouchers = VoucherDao.getVouchersByCondition(shopName);
            if (!vouchers.isEmpty()) {
            String voucherListName = "vouchers_" + shopName.substring(0, 1);
            request.setAttribute("vouchers_" + shopName, vouchers);
            }
            
            }
            
            request.setAttribute("selectedItems", selectedItems);
            request.setAttribute("cartGroup", groupedByShop);
            
            // Tiếp tục xử lý trang Checkout
            RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
            dispatcher.forward(request, response);*/
            Map<List<CartDetail>, List<Vouchers>> map = new HashMap<>();

            // Iterate over the vouchers list
            

        } else {
            // Xử lý trường hợp không có sản phẩm nào được chọn
            // Có thể điều hướng hoặc hiển thị thông báo lỗi
            response.sendRedirect("cart.jsp");
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
        /// Lấy danh sách sản phẩm đã chọn từ request parameter
        /* String selectedProductIds = request.getParameter("selectedProductIds");

    if (selectedProductIds != null && !selectedProductIds.isEmpty()) {
        String[] selectedIdsArray = selectedProductIds.split(",");
        
        // Thực hiện các bước thanh toán với danh sách sản phẩm đã chọn
        // (ví dụ: tạo đơn đặt hàng, giảm số lượng sản phẩm từ kho, v.v.)
        
        // Điều hướng hoặc hiển thị thông báo thanh toán thành công
        response.sendRedirect("payment-success.jsp");
    } else {
        // Xử lý trường hợp khi không có sản phẩm nào được chọn
        // Có thể điều hướng hoặc hiển thị thông báo lỗi
        response.sendRedirect("cart.jsp");
    }*/

        // Lấy danh sách sản phẩm đã chọn từ session
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
