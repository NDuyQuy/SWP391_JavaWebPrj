/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.CategoryDao;
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
import model.*;
import javax.servlet.annotation.MultipartConfig;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;
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
        String url = "seller/shopproduct_management.jsp";
        try {
            int user_id = ((Users) request.getSession().getAttribute("user")).getId();
            String open = request.getParameter("open");
            if (open != null) {
                request.getSession().setAttribute("SCategoryList", CategoryDao.getShopCategoryByShop(user_id));
                if (open.equals("create")) {
                    url = "seller/addnew_product.jsp";
                    //request.getRequestDispatcher(url).forward(request, response);
                    response.sendRedirect(url);
                }else{
                    url = "seller/edit_product.jsp";
                    int product_id = Integer.parseInt(request.getParameter("p_id"));
                    Products p = SellersDao.getProductById(product_id);
                    String realPath = request.getServletContext().getRealPath(p.getImg());
                    String prefix = p.getImg().replaceAll("\\\\", "/");
                    request.getSession().setAttribute("product", p);
                    
                    Stream<Path> ps = Files.list(Paths.get(realPath));
                    List<String> imgPaths;
                    imgPaths = ps.map(Path::getFileName).map(Path::toString).collect(Collectors.toList());
                    for (int i = 0; i < imgPaths.size(); i++) {
                        imgPaths.set(i,prefix+File.separator+imgPaths.get(i));
                    }
                    request.getSession().setAttribute("imgs", imgPaths);
                    
                    response.sendRedirect(url);
                    //request.getRequestDispatcher(url).forward(request, response);
                }
            } else {
                //Get the list of shop categories
                request.getSession().setAttribute("products", SellersDao.getShopProducts(user_id));
                //response.sendRedirect(url);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (NullPointerException e) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String url = "/seller/shopproduct_management.jsp";
        Users user = (Users) request.getSession().getAttribute("user");
        if(user==null){
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            url = "/login.jsp";
        }
        int user_id = user.getId();
        String act = request.getParameter("act");
        String uploadPath = null ;        Products p = null;
        String serverContextPath = request.getServletContext().getRealPath("");
        if (act!=null) {
            try {
                switch(act){
                    case "create":
                        uploadPath = getNewDir(user_id);
                        //UPLOAD IMG FILE INTO uploadPath(dir)
                        uploadImageFile(request, uploadPath);
                        p = getProduct(request);
                        uploadPath = uploadPath.replace(serverContextPath, "");
                        uploadPath = uploadPath.replaceAll("\\\\", "/");
                        p.setImg(uploadPath);
                        SellersDao.createShopProducts(p, user_id);
                        break;
                    case "edit":
                        p = getProduct(request);
                        Products _p = SellersDao.getProductById(p.getProduct_id());
                        uploadPath = Paths.get(serverContextPath, _p.getImg()).toString();
                        if(isUploadNewImg(request)){
                            //DELETE OLD FILE IN FOLDER THEN UPLOAD THE NEW FILE INTO IT
                            delOldFile(uploadPath); 
                            uploadImageFile(request, uploadPath);
                        }
                        SellersDao.editShopProducts(p);
                        break;
                    case "delete":
                        int product_id = Integer.parseInt(request.getParameter("productID"));
                        SellersDao.deleteShopProducts(product_id);
                        break;
                    default:    break;
                }
                request.getSession().setAttribute("products", SellersDao.getShopProducts(user_id));
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            request.getRequestDispatcher(url).forward(request, response);
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
    
    private String getNewDir(int user_id) throws IOException{
        // Generate a unique product ID using UUID
        String productId = UUID.randomUUID().toString().substring(0,7);
        // Create the directory structure if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + "img" 
                + File.separator + "seller"+ File.separator + String.valueOf(user_id)+File.separator+String.valueOf(productId);
        // IF DIR EXISTS RANDOM AGAIN TO UNTIL DIR DONT EXISTS
        while(Files.exists(Paths.get(uploadPath))) {
            productId = UUID.randomUUID().toString().substring(0,7);
            uploadPath = getServletContext().getRealPath("") + "img" 
                + File.separator + "seller"+ File.separator + String.valueOf(user_id)+File.separator+String.valueOf(productId);
        }
        // IF DIR EXISTS = OUT LOOP -> CREATE NEW DIR
        Files.createDirectories(Paths.get(uploadPath));
        return uploadPath;
    }
    private boolean isUploadNewImg(HttpServletRequest request) throws IOException, ServletException{
        boolean check = false;
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if(part.getName().equals("images")){
                if(part.getSize()>0){
                    check = true;
                }
            }
        }
        return check;
    }
    private void uploadImageFile(HttpServletRequest request, String uploadPath) throws IOException, ServletException, Exception{
        // Process file uploads
        Collection<Part> parts = request.getParts();
        int count = 0;
        for (Part part : parts) {
            // Check if the part is the file input with the name "images"
            if (part.getName().equals("images")) {
                count++;
                String fileName = String.valueOf(count)+".png";
                String finalPath = Paths.get(uploadPath,fileName).toString();
                if (part.getSize() > 0) {
                    part.write(finalPath);
                }
                boolean isExists = Files.exists(Paths.get(finalPath));
                if(!isExists){
                    throw new Exception("Lưu hình ảnh thất bại");
                }
            }
        }
    }
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
    private Products getProduct(HttpServletRequest request) throws ServletException{
        Products product = null;
        try {
            int product_id = (request.getParameter("productId")!= null)?Integer.parseInt(request.getParameter("productId")):0;
            String name = request.getParameter("productName");
            String description = request.getParameter("description");
            int scate_id = Integer.parseInt(request.getParameter("category"));
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            product = new Products(scate_id, description, name, price, quantity);
            product.setProduct_id(product_id);
        } catch (Exception e) {
            
        }
        return product;
    }
    private void delOldFile(String directoryPath){
        try {
            // List all files in the directory
            Files.list(Paths.get(directoryPath))
                 // Filter out directories
                 .filter(Files::isRegularFile)
                 // Delete each file
                 .forEach(file -> {
                     try {
                         Files.delete(file);
                         System.out.println("Deleted file: " + file.getFileName());
                     } catch (IOException e) {
                         System.err.println("Failed to delete file: " + file.getFileName());
                         e.printStackTrace();
                     }
                 });
        } catch (IOException e) {
            System.err.println("Failed to list files in directory: " + directoryPath);
            e.printStackTrace();
        }
    }
}
