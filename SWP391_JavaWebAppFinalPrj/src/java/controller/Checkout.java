/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
        
        
        
        
        List<CartDetail> selectedItems = (List<CartDetail>) request.getSession().getAttribute("selectedItems");

        if (selectedItems != null && !selectedItems.isEmpty()) {

            Map<String, List<CartDetail>> groupedByShop = selectedItems.stream()
                    .collect(Collectors.groupingBy(cartItem -> cartItem.getProduct().getShop().getShop_name()));
            for (Map.Entry<String, List<CartDetail>> entry : groupedByShop.entrySet()) {
                String shopName = entry.getKey();
                List<CartDetail> shopItems = entry.getValue();

                // Lấy cửa hàng dựa vào tên cửa hàng
                Shops shop = shopItems.get(0).getProduct().getShop();
                if (shop != null) {
                    int shopId = shop.getShop_id();
                    if (shopId != -1) {
                        // Lấy danh sách voucher của cửa hàng
                        List<Vouchers> shopVouchers = voucherDao.getVouchersByShopId(shopId);
                        request.setAttribute("shopVouchers_" + shopId, shopVouchers);
                    }
                }
            }

            // Lấy danh sách voucher của hệ thống
            List<Vouchers> systemVouchers = null;
            systemVouchers = voucherDao.getVouchersByType(0);

            request.setAttribute("systemVouchers", systemVouchers);
            //     request.setAttribute("shopVouchersMap", shopVouchersMap);
            request.setAttribute("selectedItems", selectedItems);
            request.setAttribute("cartGroup", groupedByShop);

            // Tiếp tục xử lý trang Checkout
            RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("cart.jsp");
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
        response.setContentType("text/html;charset=UTF-8");
        
        
        
        
        
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