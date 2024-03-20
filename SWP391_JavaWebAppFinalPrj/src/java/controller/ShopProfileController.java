/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SellersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Shops;
import model.Users;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ShopProfileController", urlPatterns = {"/shopprofile"})
@MultipartConfig
public class ShopProfileController extends HttpServlet {

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
            out.println("<title>Servlet ShopProfileController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopProfileController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String shop_name = request.getParameter("sname");
        String description = request.getParameter("des");
        try {
            int shop_id = ((Users)request.getSession().getAttribute("user")).getId();
            Part p = request.getPart("logo");
            String upLoadDir = null;
            if(p!=null){
                if(p.getSize()>0){
                    upLoadDir = getDir(shop_id) + "\\logo.jpg";
                    p.write(upLoadDir);
                }
            }
            if(upLoadDir!=null){
                Shops shops = (Shops) request.getSession().getAttribute("shop");
                upLoadDir = upLoadDir.replace(getServletContext().getRealPath(""), "");
                upLoadDir = upLoadDir.replaceAll("\\\\", "/");
                shops.setShop_img(upLoadDir);
                shops.setDescription(description);
                shops.setShop_name(shop_name);
                SellersDao.updateShopInfo(shops);
            }else{
                Shops shop = (Shops) request.getSession().getAttribute("shop");
                shop.setDescription(description);
                shop.setShop_name(shop_name);
                SellersDao.updateShopInfo(shop);
            }
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
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
    private String getDir(int user_id) throws IOException{
        String uploadPath = Paths.get(getServletContext().getRealPath(""),"img", "users","shop_logo",String.valueOf(user_id)).toString();
        // IF DIR EXISTS RANDOM AGAIN TO UNTIL DIR DONT EXISTS
        if(!Files.exists(Paths.get(uploadPath))) Files.createDirectories(Paths.get(uploadPath));
        else Files.delete(Paths.get(uploadPath,"logo.jpg"));
        return uploadPath;
    }
    
}
