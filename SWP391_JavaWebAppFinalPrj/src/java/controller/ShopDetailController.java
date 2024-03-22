/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDao;
import dao.ProductDao;
import dao.SellersDao;
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
import model.Products;
import model.Shops;
import model.ShopCategory;

/**
 *
 * @author hien
 */
public class ShopDetailController extends HttpServlet {

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
        int s_id = Integer.parseInt(request.getParameter("id"));
        Shops shop = SellersDao.getShopById(s_id);
        ArrayList<Products> plist = ProductDao.getProductsByShop(s_id);
        
        for(Products p : plist){
            String folder = p.getImg();
            p.setImg(getImagePath(folder));
        }
        
        ArrayList<ShopCategory> cate_shop = CategoryDao.getShopCategoryByShop(s_id);
        HttpSession session = request.getSession();
        session.setAttribute("sh", shop);
        session.setAttribute("cate_shop", cate_shop);
        session.setAttribute("product_by_shop", plist);
        session.setAttribute("sh_address", shop.getUsers().getAddress());
        session.setAttribute("psize", plist.size());
        request.getRequestDispatcher("shop_detail.jsp").forward(request, response);
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
