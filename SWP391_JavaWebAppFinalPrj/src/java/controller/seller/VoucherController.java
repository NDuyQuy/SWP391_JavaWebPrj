/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author ASUS
 */
public class VoucherController extends HttpServlet {

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
            out.println("<title>Servlet VoucherController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VoucherController at " + request.getContextPath() + "</h1>");
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
        String url = "/seller/seller_voucher_management.jsp";
        int id = ((User) request.getSession().getAttribute("user")).getUserID();
        String open = request.getParameter("open");
        if (open != null) {
            url = (open.equals("create")) ? "/seller/seller_createvoucher.jsp" : "/seller/seller_editvoucher.jsp";
            try {
                int voucher_id = Integer.parseInt(request.getParameter("v_id"));
                Voucher v = SellersDao.getVoucherByID(voucher_id);
                request.setAttribute("voucher", v);
            } catch (Exception e) {
            }
        } else {
            //Get the list of shop categories
            request.getSession().setAttribute("vouchers", SellersDao.getShopVouchers(id));
        }
        request.getRequestDispatcher(url).forward(request, response);
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
        String url = "/seller/seller_voucher_management.jsp";
        int id = ((User) request.getSession().getAttribute("user")).getUserID();
        String act = request.getParameter("act");
        Voucher voucher = null;
        try {
            switch (act) {
                case "create":
                    voucher = getVoucher(request, response);
                    voucher.setShop_id(id);
                    SellersDao.createShopVoucher(voucher);
                    break;
                case "edit":
                    voucher = getVoucher(request, response);
                    voucher.setShop_id(id);
                    SellersDao.editShopVoucher(voucher);
                    break;
                case "delete":
                    int voucher_id = Integer.parseInt(request.getParameter("voucherId"));
                    SellersDao.deleteVoucher(voucher_id);
                    break;
            }
        } catch (Exception e) {
            String errorMessage = e.getMessage();
            String v = "";
        }
        //ReGet the list of shop categories
        request.getSession().setAttribute("vouchers", SellersDao.getShopVouchers(id));
        request.getRequestDispatcher(url).forward(request, response);
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

    private Voucher getVoucher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Voucher voucher = null;
        try {
            String voucher_id = request.getParameter("voucher_id");
            int id = (voucher_id == null || voucher_id.isEmpty()) ? 0 : Integer.parseInt(voucher_id);
            int type = Integer.parseInt(request.getParameter("voucher_type"));
            String code = request.getParameter("voucher_code");
            Date start_date = Date.valueOf(request.getParameter("start_date"));
            Date expire_date = Date.valueOf(request.getParameter("expire_date"));
            String promotion_type = request.getParameter("promotion_type");
            code = promotion_type + code;
            int discount_amount = Integer.parseInt(request.getParameter("discount_amount"));
            int min_require = Integer.parseInt(request.getParameter("min_require"));
            int use_count = Integer.parseInt(request.getParameter("use_count"));
            String description = request.getParameter("description");
            int product_applied = (request.getParameter("product_applied")!= null)?Integer.parseInt(request.getParameter("product_applied")): 1;
            voucher = new Voucher(id, code, discount_amount, start_date, expire_date, type, min_require, description, type, product_applied, use_count);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return voucher;
    }
}