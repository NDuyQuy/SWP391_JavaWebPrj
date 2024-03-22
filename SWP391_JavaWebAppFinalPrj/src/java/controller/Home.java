/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.MainCategory;
import model.Products;
import model.ShopCategory;

/**
 *
 * @author hien
 */
public class Home extends HttpServlet {

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
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
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
        
        String path = getServletContext().getRealPath("");
        
        ProductDao pd = new ProductDao();
        SellersDao sd = new SellersDao();
        CategoryDao cd = new CategoryDao();
        UsersDao ud = new UsersDao();
        OrderDetailDao odd = new OrderDetailDao();
        OrdersDao od = new OrdersDao();

        ArrayList<MainCategory> mcate_list = cd.getMainCategories();
        ArrayList<ShopCategory> scate_list = cd.getShopCategories();
        ArrayList<Products> newest_products = pd.getNewestProducts();
        ArrayList<Products> top_sellers = pd.getTopSellers();
        
        for(Products p : newest_products){
            String folder = p.getImg();
            p.setImg(getImagePath(folder));
        }
        
        for(Products p : top_sellers){
            String folder = p.getImg();
            p.setImg(getImagePath(folder));
        }

        HttpSession session = request.getSession();
        session.setAttribute("main_category_list", mcate_list);
        session.setAttribute("shop_category_list", scate_list);
        session.setAttribute("newest_products", newest_products);
        session.setAttribute("topsellers", top_sellers);

        session.setAttribute("productDao", pd);
        session.setAttribute("sellersDao", sd);
        session.setAttribute("categoryDao", cd);
        session.setAttribute("usersDao", ud);
        session.setAttribute("orderDetailDao", odd);
        session.setAttribute("ordersDao", od);
        session.setAttribute("fpath", path);
        session.removeAttribute("kw");
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
    
    private String getImagePath(String folder){
        String res = null;
        List<File> all_img = new ArrayList<>();
        String fpath = getServletContext().getRealPath("") + folder;
        try{
            all_img = Files.walk(Paths.get(fpath))
                .filter(Files::isRegularFile)
                .map(Path::toFile)
                .collect(Collectors.toList());
            res = all_img.get(0).getPath().replace(getServletContext().getRealPath(""), "");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return res;
    }
}
