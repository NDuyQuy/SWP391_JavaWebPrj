/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.SellersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Shops;

/**
 *
 * @author hien
 */
public class SearchShopServlet extends HttpServlet {

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
        try {
            request.setCharacterEncoding("utf-8");
            String keyword = request.getParameter("kw");
            ArrayList<Shops> shoplist = SellersDao.getAllShop();
            ArrayList<Shops> result = new ArrayList<>();
            if (keyword == null) {
                result = shoplist;
            } else {
                for (Shops s : shoplist) {
                    if (keyword.length() > 2) {
                        if (s.getShop_name().toLowerCase().contains(keyword.toLowerCase())) {
                            result.add(s);
                        }
                    }
                }
            }

            int page, perPage = 10;
            int numPage = result.size() % perPage == 0 ? result.size() / perPage : result.size() / perPage + 1;
            String pageid = request.getParameter("page");
            if (pageid == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageid);
            }
            int first = (page - 1) * perPage;
            int last = Math.min(page * perPage, result.size()) - 1;

            request.setAttribute("first", first);
            request.setAttribute("last", last);
            request.setAttribute("num", numPage);

            HttpSession session = request.getSession();
            session.setAttribute("kw", keyword);
            session.setAttribute("shop_search", result);
            if (result.isEmpty() || result == null) {
                session.setAttribute("shop_search", null);
            }
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
