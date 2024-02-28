/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MainCategory;
import model.Product;

/**
 *
 * @author hien
 */
public class SearchProductServlet extends HttpServlet {

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
            String category = request.getParameter("cate");
            ArrayList<Product> all_product = ProductDao.getAllProducts();
            ArrayList<Product> result = new ArrayList<>();
            if (keyword == null && category != null) {
                result = ProductDao.getProductsByMainCateId(Integer.parseInt(category));
            } else if (keyword.equals("") && category == null) {
                result = all_product;
            } else if (keyword != null) {

                String[] kw = keyword.split(" ");
                for (Product p : all_product) {
                    for (int i = 0; i < kw.length; i++) {
                        if (p.getProductName().contains(kw[i])) {
                            result.add(p);
                            break;
                        } else if (p.getmCate().getCategoryName().contains(kw[i])) {
                            result.add(p);
                            break;
                        } else if (p.getsCate().getCategoryName().contains(kw[i])) {
                            result.add(p);
                            break;
                        }
                    }
                }
            }

            int page, perPage = 20;
            int numPage = result.size() % perPage == 0 ? result.size() / perPage : result.size() / perPage + 1;
            String pageid = request.getParameter("page");
            if (pageid == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageid);
            }
            int first = (page - 1) * perPage;
            int last = Math.min(page * perPage, result.size()) - 1;

            float max_price = ProductDao.getHighestPrice().getPrice();

            request.setAttribute("first", first);
            request.setAttribute("last", last);
            request.setAttribute("num", numPage);
            request.setAttribute("max_price", max_price);
            HttpSession session = request.getSession();
            session.setAttribute("kw", keyword);
            session.setAttribute("product_list", result);
            if (result.isEmpty()) {
                session.setAttribute("product_list", null);
            }
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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