/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import javax.servlet.http.HttpSession;
import model.User;
/**
 *
 * @author ASUS
 */
public class ShopCategoryController extends HttpServlet {

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
            out.println("<title>Servlet ShopCategoryController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopCategoryController at " + request.getContextPath() + "</h1>");
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
        int id = ((User)request.getSession().getAttribute("user")).getUserID();
        //Get the list of shop categories
        request.getSession().setAttribute("shop_categories", SellersDao.getShopCategories(id));
        request.getRequestDispatcher("/seller/shopcategory_management.jsp").forward(request, response);
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
        //sc stand for shop category        ;           mc stand for main category
        String url = "/shopcategory_management.jsp";
        HttpSession session = request.getSession();
        //get the action string
        String action = request.getParameter("act");
        int shop_id = ((User)request.getSession().getAttribute("user")).getUserID();
        if(action.equals("addnew")){
            int mc_id = Integer.parseInt(request.getParameter("a_mc"));
            String name = request.getParameter("categoryName");
            SellersDao.createShopCategory(mc_id, shop_id, name);
        }else if (action.equals("edit")){
            int sc_id = Integer.parseInt(request.getParameter("categoryId"));
            int mc_id = Integer.parseInt(request.getParameter("e_mc"));
            String name = request.getParameter("categoryName");
            SellersDao.editShopCategory(mc_id, sc_id, name);
        }else if (action.equals("delete")){
            int sc_id = Integer.parseInt(request.getParameter("categoryId"));
            SellersDao.deleteShopCategory(sc_id);
        }
        //add the new list into session
        request.getSession().setAttribute("shop_categories", SellersDao.getShopCategories(shop_id));
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

}
