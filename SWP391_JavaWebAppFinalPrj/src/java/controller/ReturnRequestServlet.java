/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RefundsAndReturnsDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ReturnRequestServlet", urlPatterns = {"/ReturnRequestServlet"})
public class ReturnRequestServlet extends HttpServlet {

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
            out.println("<title>Servlet ReturnRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReturnRequestServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Lấy thông tin từ form
            String[] returnProducts = request.getParameterValues("returnProduct");
            String reason = request.getParameter("reason");
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            // Tính tổng tiền hoàn lại
            int totalRefundAmount = 0;
            if (returnProducts != null) {
                for (String productId : returnProducts) {
                    // Số tiền hoàn lại sẽ được tính dựa trên giá của sản phẩm
                    int productPrice = RefundsAndReturnsDao.getProductPrice(Integer.parseInt(productId));
                    totalRefundAmount += productPrice;
                }
            }

            // Tạo đối tượng ReturnRequest
            ReturnRequest returnRequest = new ReturnRequest();
            returnRequest.setOrderId(orderId);
            returnRequest.setReturnProducts(returnProducts);
            returnRequest.setReason(reason);
            returnRequest.setRefundAmount(totalRefundAmount);

            // Lưu yêu cầu trả hàng/hoàn tiền vào cơ sở dữ liệu
            boolean success = ReturnRequestDao.saveReturnRequest(returnRequest);

            if (success) {
                // Chuyển hướng người dùng đến trang thông báo thành công
                response.sendRedirect("ReturnSuccess.jsp");
            } else {
                out.println("Failed to submit return request");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            out.close();
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
