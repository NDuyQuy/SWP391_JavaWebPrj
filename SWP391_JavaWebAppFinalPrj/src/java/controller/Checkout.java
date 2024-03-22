/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.VouchersDao;
import dao.OrdersDao;
import dao.SellersDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
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
                    Collectors.groupingBy(c -> c.getProduct().getShop().getShop_name())
            );

            Map<List<Vouchers>, List<CartDetail>> newCartGroup = new HashMap<>();
            for (Map.Entry<String, List<CartDetail>> entry : cartGroup.entrySet()) {
                String shopName = entry.getKey();
                //GET THE SHOP ITEM
                List<CartDetail> shopItems = entry.getValue();
                double shopTotal = calculateShopTotal(shopItems);
                // Lấy danh sách voucher của cửa hàng
                List<Vouchers> vouchers = VouchersDao.getVouchersByCondition(shopName, shopTotal);

                newCartGroup.put(vouchers, shopItems);
            }

            request.setAttribute("selectedItems", selectedItems);

            request.getSession().setAttribute("cartGroup", newCartGroup);

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

    private double calculateShopTotal(List<CartDetail> shopItems) {
        double total = 0.0;
        for (CartDetail item : shopItems) {
            total += item.getQuantity() * item.getProduct().getMoney();
        }
        return total;
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
        Users user = (Users) request.getSession().getAttribute("user");
        int customer_id = user.getId();
        String payment_method = request.getParameter("paymentMethod");
        String receiver_name = request.getParameter("receiver_name");
        String receiver_phone = request.getParameter("receiver_phone");
        String receiver_address = request.getParameter("receiver_addr");
        String voucherIdString = request.getParameter("voucherIdStr");
        String shippingStr = request.getParameter("shippingmethodStr");
        Map<List<Vouchers>, List<CartDetail>> cartGroup = (Map<List<Vouchers>, List<CartDetail>>) request.getSession().getAttribute("cartGroup");
        String[] vidArr = voucherIdString.split(",");
        String ship[] = shippingStr.split(",");
        if (cartGroup != null) {
            int i = 0;
            for (Map.Entry<List<Vouchers>, List<CartDetail>> entry : cartGroup.entrySet()) {
                int voucherid = Integer.parseInt(vidArr[i]);
                int ship_cost = Integer.parseInt(ship[i]);
                i++;
                Vouchers vouchers = SellersDao.getVoucherByID(voucherid);
                String shipping_method = getShipMethod(ship_cost) ;
                String shopName = entry.getValue().get(0).getProduct().getShop().getShop_name();
                List<CartDetail> shopItems = entry.getValue();
                double total = calculateShopTotal(shopItems);
                Orders order = new Orders();
                order.setShop_id(SellersDao.getShopIdByName(shopName));
                order.setCustomer_id(customer_id);
                order.setPayment_method(payment_method);
                order.setReceiver_name(receiver_name);
                order.setReceiver_phone(receiver_phone);
                order.setReceiver_address(receiver_address);
                order.setShipping_method(shipping_method);
                order.setShipping_cost(ship_cost);
                order.setTotal((int)total);
                if(voucherid!=0){
                    order.setVoucher_id(voucherid);
                }
                

                // Tạo danh sách chi tiết đơn hàng cho cửa hàng hiện tại
                List<OrderDetail> orderDetails = new ArrayList<>();
                for (CartDetail cartItem : shopItems) {
                    OrderDetail orderDetail = new OrderDetail();
                    // Thiết lập thông tin cho orderDetail từ cartItem
                    orderDetail.setOrderID(order.getOrder_id()); // Set ID của đơn hàng
                    orderDetail.setProductID(cartItem.getProduct().getProduct_id()); // Set ID sản phẩm
                    orderDetail.setQuantity(cartItem.getQuantity());
                    if(vouchers==null){
                        orderDetail.setTotalPrice(cartItem.getQuantity()*cartItem.getProduct().getMoney());
                    }else{
                        orderDetail.setTotalPrice(cartItem.getQuantity()*cartItem.getProduct().getMoney()-(vouchers.getDiscount_amount()/shopItems.size()));
                    }
                    orderDetails.add(orderDetail);
                }
                try {
                    // Thêm đơn hàng và chi tiết đơn hàng vào cơ sở dữ liệu
                    OrdersDao.addOrderAndDetails(order, orderDetails);
                } catch (Exception ex) {
                    Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.getWriter().println("Đã thêm đơn hàng và chi tiết đơn hàng thành công!");
        } else {
            response.getWriter().println("Không thể thêm đơn hàng vì giỏ hàng trống!");
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
    private String getShipMethod(int cost){
        if(cost==10000){
            return "nhanh";
        }else if(cost==20000){
            return "hỏa tốc";
        }else{
            return "tiết kiệm";
        }
    }
}