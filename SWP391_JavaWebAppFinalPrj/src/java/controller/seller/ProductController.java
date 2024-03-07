/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.SellersDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.User;
import javax.servlet.annotation.MultipartConfig;
import java.util.Collection;
/**
 *
 * @author ASUS
 */
@MultipartConfig
public class ProductController extends HttpServlet {

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
            out.println("<title>Servlet ProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductController at " + request.getContextPath() + "</h1>");
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
        String url = "/seller/shopproduct_management.jsp";
        int id = ((User) request.getSession().getAttribute("user")).getUserID();
        String open = request.getParameter("open");
        if (open != null) {
            if (open.equals("create")) {
                url = "seller/addnew_product.jsp";
                response.sendRedirect(url);
            }
        } else {
            //Get the list of shop categories
            request.getSession().setAttribute("products", SellersDao.getShopProducts(id));
            request.getRequestDispatcher(url).forward(request, response);
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
        String url = "/seller/shopproduct_management.jsp";
        int user_id = ((User) request.getSession().getAttribute("user")).getUserID();
        /* STORE IMG FIRST*/
        // Generate a unique product ID using UUID
        String productId = UUID.randomUUID().toString();
        // Create the directory structure if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + "img" 
                + File.separator + "seller"+ File.separator + String.valueOf(user_id)+File.separator+String.valueOf(productId);
        // IF DIR EXISTS RANDOM AGAIN TO UNTIL DIR DONT EXISTS
        while(Files.exists(Paths.get(uploadPath))) {
            productId = UUID.randomUUID().toString();
            uploadPath = getServletContext().getRealPath("") + "img" 
                + File.separator + "seller"+ File.separator + String.valueOf(user_id)+File.separator+String.valueOf(productId);
        }
        // IF DIR EXISTS = OUT LOOP -> CREATE NEW DIR
        Files.createDirectories(Paths.get(uploadPath));
        // Process file uploads
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            // Check if the part is the file input with the name "images"
            if (part.getName().equals("images")) {
                String fileName = extractFileName(part);
                String finalPath = uploadPath + File.separator + fileName;
                if (fileName.length() > 0) {
                    part.write(uploadPath + File.separator + fileName);
                }
                boolean isExists = Files.exists(Paths.get(finalPath));
                if(!isExists){
                    // STORE IMG FAIL 
                    // DO SOMETHING ABC
                }
            }
        }
        response.getWriter().println("Your files are uploaded!");
        //MultipartRequest mr = new MultipartRequest(request, uploadPath);
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

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
