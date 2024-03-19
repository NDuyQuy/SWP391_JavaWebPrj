/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import dao.*;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
/**
 *
 * @author DELL
 */
public class AdminServlet extends HttpServlet {

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
        String url = "/AdminMainpage.jsp";
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        boolean Continue = true;
        try {
            String action = request.getParameter("Action");
            if (action.equals("ViewCategory")) {
                ArrayList<MainCategory> CategoryList = AdminDAO.Get_Category_List();
                if (CategoryList != null) {
                    session.setAttribute("CL", CategoryList);
                }
            }
            else if (action.equals("AddCategory")) {
                Continue = false;
                String Name = request.getParameter("categoryName");
                String Description = request.getParameter("description");
                AdminDAO.Add_Main_Category(Name, Description);
                url = "/AdminCategory.jsp";
            }
            else if(action.equals("EditCategory")){
                Continue = false;
                String Name = request.getParameter("categoryName");
                int id = Integer.parseInt(request.getParameter("categoryId"));
                String Description = request.getParameter("description");
                MainCategory mainct = new MainCategory(id, Name, Description);
                AdminDAO.Update_Main_Category(mainct);
                url = "/AdminCategory.jsp";
            }
            else if(action.equals("DeleteCategory")){
                Continue = false;
                int id = Integer.parseInt(request.getParameter("categoryId"));
                AdminDAO.Delete_Main_Category(id);
                url = "/AdminCategory.jsp";
            }
            else if(action.equals("ViewVoucher")) {
                ArrayList<Vouchers> VoucherList = VoucherDao.getSystemVouchers();
                if (VoucherList != null) {
                    session.setAttribute("VL", VoucherList);
                }
            }
            else if(action.equals("AddNewVoucher")) {
                Continue = false;
                String code = request.getParameter("voucher_code");
                int discount = Integer.parseInt(request.getParameter("discount_amount"));
                String unit = request.getParameter("promotion_type");
                if (unit.equals("Mv")) code = "Mv" + code;
                else if (unit.equals("Pv")) code = "Pv" + code;
                Date start_date = Date.valueOf(request.getParameter("start_date"));
                Date expire_date = Date.valueOf(request.getParameter("expire_date"));
                int type = 0;
                int min = Integer.parseInt(request.getParameter("min_require"));
                int count = Integer.parseInt(request.getParameter("use_count"));
                String description = request.getParameter("description");
                Vouchers v = new Vouchers(-1, code, discount, start_date, expire_date, type, min, description, count);
                VoucherDao.addVoucher(v);
                url = "/AdminVoucher.jsp";
            }
            else if(action.equals("GetMainVoucher")) {
                int voucherId = Integer.parseInt(request.getParameter("id"));
                Vouchers v = VoucherDao.getVoucherById(voucherId);
                if (v != null) {
                    String code = v.getCode();
                    code = code.substring(2);
                    v.setCode(code);
                    session.setAttribute("Vch", v);
                }
                
            }
            else if(action.equals("EditVoucher")) {
                Continue = false;
                int voucher_id = Integer.parseInt(request.getParameter("voucher_id"));
                String code = request.getParameter("voucher_code");
                int discount = Integer.parseInt(request.getParameter("discount_amount"));
                String unit = request.getParameter("promotion_type");
                if (unit.equals("Mv")) code = "Mv" + code;
                else if (unit.equals("Pv")) code = "Pv" + code;
                Date start_date = Date.valueOf(request.getParameter("start_date"));
                Date expire_date = Date.valueOf(request.getParameter("expire_date"));
                int type = 0;
                int min = Integer.parseInt(request.getParameter("min_require"));
                int count = Integer.parseInt(request.getParameter("use_count"));
                String description = request.getParameter("description");
                Vouchers v = new Vouchers(voucher_id, code, discount, start_date, expire_date, type, min, description, count);
                VoucherDao.updateVoucher(v);
                url = "/AdminVoucher.jsp";
            }
            else if(action.equals("DeleteVoucher")) {
                Continue = false;
                int id = Integer.parseInt(request.getParameter("VoucherId"));
                VoucherDao.deleteVoucher(id);
                url = "/AdminVoucher.jsp";
            }
            else if(action.equals("ViewRefund")) {
                ArrayList<RefundsnReturns> RefundList = AdminDAO.Get_Refund_List();
                if (RefundList != null) {
                    session.setAttribute("RL", RefundList);
                }
            }
            else if(action.equals("EditRefund")) {
                Continue = false;
                int id = Integer.parseInt(request.getParameter("requestId"));
                String status = request.getParameter("status");
                AdminDAO.Update_Refund(status, id);
                url = "/AdminRefund.jsp";
            }
            else if(action.equals("ViewBan")) {
                ArrayList<ReportDetail> BanList = AdminDAO.Get_Report_List();
                if (BanList != null) {
                    session.setAttribute("BL", BanList);
                }
            }
            else if(action.equals("ApplyBan")) {
                Continue = false;
                int id = Integer.parseInt(request.getParameter("userId"));
                String banAction = request.getParameter("banAction");
                int bandays = 0, status = 0;
                if (banAction.equals("0")) {
                    status = -1;
                    bandays = 0;
                }
                else if (banAction.equals("7")) {
                    status = 2;
                    bandays = 7;
                }
                else if (banAction.equals("14")) {
                    status = 2;
                    bandays = 14;
                }
                else if (banAction.equals("30")) {
                    status = 2;
                    bandays = 30;
                }
                else if (banAction.equals("999999")) {
                    status = 3;
                    bandays = 0;
                }
                AdminDAO.Update_Ban(id, status, bandays);
                url = "/AdminBan.jsp";
            }
            else if(action.equals("ViewApproveRequest")) {
                ArrayList<ApproveRequest> requestList = AdminDAO.Get_Approve_Request();
                if (requestList != null) {
                    session.setAttribute("SL", requestList);
                }
            }
            else if(action.equals("AcceptSeller")) {
                Continue = false;
                int id = Integer.parseInt(request.getParameter("ID"));
                AdminDAO.Accept_Approve_Request(id);
                url = "/AdminApprove.jsp";
            }
            else if(action.equals("DeclineSeller")) {
                Continue = false;
                int id = Integer.parseInt(request.getParameter("ID"));
                AdminDAO.Decline_Approve_Request(id);
                url = "/AdminApprove.jsp";
            }
        }
        catch (Exception e) {
            log("error at admin servlet: " + e.toString());
            System.out.println("Error While Loading...");
        }
        finally {
            if (!Continue) httpResponse.sendRedirect(httpRequest.getContextPath() + url);
            System.out.println("Loading...");
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
