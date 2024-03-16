/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.RatingDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Products;
import model.Ratings;

/**
 *
 * @author hien
 */
public class ProductDetailController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailController at " + request.getContextPath() + "</h1>");
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
        try {
            String product = request.getParameter("product");
            Products pro = ProductDao.getProductById(Integer.parseInt(product));
            ArrayList<Products> product_by_shop = ProductDao.getProductsByShop(pro.getShop().getUsers().getId());
            ArrayList<Ratings> ratings_by_product = RatingDao.getRatingsByProduct(pro.getProduct_id());
            float aver_score = 0;
            int aver_rate = 0;
            if (ratings_by_product != null && !ratings_by_product.isEmpty()) {
                for (Ratings r : ratings_by_product) {
                    aver_score += r.getScore();
                }
                aver_rate = (int) Math.round((aver_score/ratings_by_product.size()) * 100);
            }

            ListIterator<Products> iter = product_by_shop.listIterator();
            while (iter.hasNext()) {
                if (iter.next().getProduct_id() == pro.getProduct_id()) {
                    iter.remove();
                }
            }
            HttpSession session = request.getSession();
            session.setAttribute("aver_rate", aver_rate);
            session.setAttribute("ratings_by_product", ratings_by_product);
            session.setAttribute("pr", pro);
            session.setAttribute("product_by_shop", product_by_shop);
            request.getRequestDispatcher("product_detail.jsp").forward(request, response);
        }catch(Exception ex){
            ex.printStackTrace();
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
