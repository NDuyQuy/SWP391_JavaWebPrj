/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author hien
 */
public class PriceFilterController extends HttpServlet {

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
            out.println("<title>Servlet PriceFilterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PriceFilterController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("utf-8");
        try {
            String keyword = request.getParameter("kw");
            String category = request.getParameter("cate");
            String price_range = request.getParameter("range");
            String[] prices = price_range.split("đ");
            int min = Integer.parseInt(prices[0]);
            int max = Integer.parseInt(prices[1].substring(3));
            
            HttpSession session = request.getSession();
            ArrayList<Product> product_list = (ArrayList<Product>) session.getAttribute("product_list");
            ArrayList<Product> result = new ArrayList<>();
            for(Product p : product_list){
                if(p.getPrice() >= min && p.getPrice() <= max){
                    result.add(p);
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
            
            session.setAttribute("kw", keyword);
            session.setAttribute("product_list", result);
            if (result.isEmpty()) {
                session.setAttribute("product_list", null);
            }
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
