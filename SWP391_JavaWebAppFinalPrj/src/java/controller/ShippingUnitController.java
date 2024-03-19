/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MessageDao;
import dao.SUDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Orders;
import model.Shops;
import model.Users;

/**
 *
 * @author DELL
 */
public class ShippingUnitController extends HttpServlet {

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
        String url = "/***";
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        boolean Continue = true;
        try {
            String action = session.getAttribute("Action").toString();
            int id = ((Users)session.getAttribute("User")).getId();
            if (action.equals("ViewWaitingOrderList")) {
                ArrayList<Orders> orders = SUDao.GetWaitingOrderList(id);
                session.setAttribute("OL", orders);
            }
            else if (action.equals("ViewAcceptOrderList")) {
                ArrayList<Orders> orders = SUDao.GetAcceptOrderList(id);
                session.setAttribute("OL", orders);
            }
            else if (action.equals("AcceptOrder")) {
                Continue = false;
                int orderId = Integer.parseInt(session.getAttribute("OrderId").toString());
                SUDao.AcceptOrder(orderId);
            }
            else if (action.equals("DeclineOrder")) {
                Continue = false;
                int orderId = Integer.parseInt(session.getAttribute("OrderId").toString());
                SUDao.DeclineOrder(orderId);
            }
            else if (action.equals("ShippingOrder")) {
                Continue = false;
                int orderId = Integer.parseInt(session.getAttribute("OrderId").toString());
                SUDao.AcceptOrder(orderId);
            }
        }
        catch (Exception ex) {
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
