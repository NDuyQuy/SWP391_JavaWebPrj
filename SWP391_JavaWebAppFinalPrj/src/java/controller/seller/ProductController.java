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
import java.nio.file.Paths;
import java.util.ArrayList;
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

        Users users = (Users) request.getSession().getAttribute("user");
        if (users == null) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        try {
            int user_id = users.getId();
            String open = request.getParameter("open");
            if (open != null) {
                if (open.equals("create")) {
                    url = "seller/addnew_product.jsp";
                    request.setAttribute("SCategoryList", CategoryDao.getShopCategoryByShop(user_id));

                } else if (open.equals("edit")) {
                    url = "seller/edit_product.jsp";
                    int productId = Integer.parseInt(request.getParameter("p_id"));
                    request.setAttribute("SCategoryList", CategoryDao.getShopCategoryByShop(user_id));
                    request.setAttribute("product", SellersDao.getProductById(productId));
                    request.setAttribute("pdl", SellersDao.getProductDetailByProductId(productId));
                    //request.getRequestDispatcher(url).forward(request, response);
                } else {
                    url = "seller/product_detail.jsp";

                }

                request.getRequestDispatcher(url).forward(request, response);
            } else {
                //Get the list of shop categories
                request.setAttribute("products", SellersDao.getShopProducts(user_id));
                //response.sendRedirect(url);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {

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
        if (user == null) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            url = "/login.jsp";
        } else {
            int user_id = user.getId();
            String act = request.getParameter("act");
            String uploadPath = null;
            Products p = null;
            ArrayList<ProductDetail> productDetails = null;
            String serverContextPath = request.getServletContext().getRealPath("");
            if (act != null) {
                try {
                    switch (act) {
                        case "create":
                            uploadPath = getNewDir(user_id);
                            //UPLOAD IMG FILE INTO uploadPath(dir)
                            List<String> imgs = uploadImageFile(request, uploadPath);
                            //GET THE PRODUCT AND THEN PRODUCT DETAIL 
                            p = extractProduct(request);
                            productDetails = extractProductDetail(request);
                            //UPDATE IMG PATH
                            int index = 0;
                            for (ProductDetail productDetail : productDetails) {
                                productDetail.setImg(imgs.get(index));
                                productDetails.set(index, productDetail);
                                index++;
                            }
                            // CREATE PRODUCT
                            SellersDao.createShopProducts(p, user_id, productDetails);
                            break;
                        case "edit":
                            p = extractProduct(request);
                            productDetails = extractProductDetail(request);
                            updateImg(request);
                            SellersDao.editShopProducts(p, productDetails);
                            addNewProductDetail(request, p.getProduct_id());
                            break;
                        default:
                            break;
                    }
                    request.setAttribute("products", SellersDao.getShopProducts(user_id));
                } catch (Exception ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            response.sendRedirect("productcontroller");
            //request.getRequestDispatcher(url).forward(request, response);
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

    private String getNewDir(int user_id) throws IOException {
        // Generate a unique product ID using UUID
        String productId = UUID.randomUUID().toString().substring(0, 7);
        // Create the directory structure if it doesn't exist
        String uploadPath = getServletContext().getRealPath("") + "img"
                + File.separator + "seller" + File.separator + String.valueOf(user_id) + File.separator + String.valueOf(productId);
        // IF DIR EXISTS RANDOM AGAIN TO UNTIL DIR DONT EXISTS
        while (Files.exists(Paths.get(uploadPath))) {
            productId = UUID.randomUUID().toString().substring(0, 7);
            uploadPath = getServletContext().getRealPath("") + "img"
                    + File.separator + "seller" + File.separator + String.valueOf(user_id) + File.separator + String.valueOf(productId);
        }
        // IF DIR EXISTS = OUT LOOP -> CREATE NEW DIR
        Files.createDirectories(Paths.get(uploadPath));
        return uploadPath;
    }

    private boolean isUploadNewImg(HttpServletRequest request) throws IOException, ServletException {
        boolean check = false;
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getName().equals("images")) {
                if (part.getSize() > 0) {
                    check = true;
                }
            }
        }
        return check;
    }

    private List<String> uploadImageFile(HttpServletRequest request, String uploadPath) throws IOException, ServletException, Exception {
        // Process file uploads
        Collection<Part> parts = request.getParts();
        List<String> imgPaths = new ArrayList<>();
        int count = 0;
        for (Part part : parts) {
            // Check if the part is the file input with the name "images"
            if (part.getName().equals("images")) {

                if (part.getSize() > 0) {
                    count++;
                    // GET THE FILE NAME 
                    String fileName = String.valueOf(count) + ".png";
                    // GET THE FINAL PATH(INCLUDE FILE) TO WRITE
                    String finalPath = Paths.get(uploadPath, fileName).toString();
                    part.write(finalPath);

                    //CHECK IF STORE IMG SUCCESS -> finalPath EXIST ELSE STORE IMG FAILED
                    boolean isExists = Files.exists(Paths.get(finalPath));
                    if (!isExists) {
                        throw new Exception("Lưu hình ảnh thất bại");
                    }

                    // REMOVE THE REAL PATH OF SERVLET CONTEXT
                    finalPath = finalPath.replace(request.getServletContext().getRealPath(""), "");
                    // CHANGE CHARACTER \ -> /
                    finalPath = finalPath.replaceAll("\\\\", "/");

                    imgPaths.add(finalPath);

                }
            }
        }
        return imgPaths;
    }

    private Products extractProduct(HttpServletRequest request) throws ServletException {
        Products product = null;
        int product_id = (request.getParameter("productId") != null) ? Integer.parseInt(request.getParameter("productId")) : 0;
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        int scate_id = Integer.parseInt(request.getParameter("category"));
        product = new Products(product_id, scate_id, scate_id, null, description, name);

        return product;
    }

    //DELETE OLD FIELD
    private boolean delOldFile(String imgFilePath) throws IOException {
        return Files.deleteIfExists(Paths.get(imgFilePath));
    }

    // UPDATE IMG
    private void updateImg(HttpServletRequest request) throws IOException, ServletException {
        String[] filePath = request.getParameterValues("imgs");
        for (int i = 0; i < filePath.length; i++) {
            String img = request.getServletContext().getRealPath("") + filePath[i];
            Part part = request.getPart("image_" + i);
            if (!part.getSubmittedFileName().isEmpty()) {
                delOldFile(img);
                part.write(img);
            }
        }
    }

    private ArrayList<ProductDetail> extractProductDetail(HttpServletRequest request) {
        ArrayList<ProductDetail> pds = new ArrayList<>();
        String[] ids = request.getParameterValues("ids");
        String[] names = request.getParameterValues("names");
        String[] prices = request.getParameterValues("prices");
        String[] quantities = request.getParameterValues("quantities");
        for (int i = 0; i < quantities.length; i++) {
            int id = 0;
            if (ids != null) {
                if (!ids[i].isEmpty()) {
                    id = Integer.parseInt(ids[i]);
                }
            }
            String name = names[i];
            double price = Double.parseDouble(prices[i]);
            int quantity = Integer.parseInt(quantities[i]);
            ProductDetail pd = new ProductDetail(id, 0, price, quantity, null, name);
            pds.add(pd);
        }
        return pds;
    }

    private ArrayList<ProductDetail> extractNewProductDetail(HttpServletRequest request, int product_id) {
        ArrayList<ProductDetail> pds = new ArrayList<>();
        String[] names = request.getParameterValues("new_names");
        String[] prices = request.getParameterValues("new_prices");
        String[] quantities = request.getParameterValues("new_quantities");
        if (names != null && prices != null && quantities != null) {
            for (int i = 0; i < quantities.length; i++) {
                int id = 0;
                String name = names[i];
                double price = Double.parseDouble(prices[i]);
                int quantity = Integer.parseInt(quantities[i]);
                ProductDetail pd = new ProductDetail(id, product_id, price, quantity, null, name);
                pds.add(pd);
            }
        }
        return pds;
    }

    private List<String> uploadNewImg(HttpServletRequest request) throws IOException, Exception {
        String[] filePath = request.getParameterValues("imgs");
        List<String> imgPaths = new ArrayList<>();
        int count = filePath.length;
        String uploadDir = request.getServletContext().getRealPath("") + filePath[0].substring(0, 20);
        for (Part part : request.getParts()) {
            // Check if the part is the file input with the name "images"
            if (part.getName().equals("new_imgs")) {

                if (!part.getSubmittedFileName().isEmpty()) {
                    count++;
                    // GET THE FILE NAME 
                    String fileName = String.valueOf(count) + ".png";
                    // GET THE FINAL PATH(INCLUDE FILE) TO WRITE
                    String finalPath = Paths.get(uploadDir, fileName).toString();
                    part.write(finalPath);

                    //CHECK IF STORE IMG SUCCESS -> finalPath EXIST ELSE STORE IMG FAILED
                    boolean isExists = Files.exists(Paths.get(finalPath));
                    if (!isExists) {
                        throw new Exception("Lưu hình ảnh thất bại");
                    }
                    // REMOVE THE REAL PATH OF SERVLET CONTEXT
                    finalPath = finalPath.replace(request.getServletContext().getRealPath(""), "");
                    // CHANGE CHARACTER \ -> /
                    finalPath = finalPath.replaceAll("\\\\", "/");

                    imgPaths.add(finalPath);

                }
            }
        }
        return imgPaths;
    }

    private void addNewProductDetail(HttpServletRequest request, int product_id) throws Exception {
        ArrayList<ProductDetail> productDetails = extractNewProductDetail(request, product_id);
        List<String> list = uploadNewImg(request);
        if (productDetails != null && !productDetails.isEmpty()) {
            int index = 0;
            for (ProductDetail p : productDetails) {
                p.setImg(list.get(index));
                productDetails.set(index, p);
                index++;
            }
            SellersDao.createProductDetails(productDetails);
        }
    }

}
