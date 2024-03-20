/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.seller;

import dao.OrdersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.*;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class CustomOrderController extends HttpServlet {

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
            out.println("<title>Servlet CustomOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomOrderController at " + request.getContextPath() + "</h1>");
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
        String url = "/seller/custom_order_management.jsp";
        try {
            int user_id = ((Users) request.getSession().getAttribute("user")).getId();
            String open = request.getParameter("open");
            if (open != null) {
                int order_id = Integer.parseInt(request.getParameter("o_id"));
                request.getSession().setAttribute("orderID", order_id);
                url = "seller/update_customorder_process.jsp";
                response.sendRedirect(url);
            } else {
                //GET CUSTOM ORDERS LIST 
                request.setAttribute("c_o_l", OrdersDao.getCustomOrderOfShop(user_id));
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
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
        String url = "/seller/custom_order_management.jsp";
        String act = request.getParameter("act");
        Users users = (Users) request.getSession().getAttribute("user");
        if(users==null){
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            url = "/login.jsp";
        }else{
            int user_id = users.getId();
            request.setAttribute("c_o_l", OrdersDao.getCustomOrderOfShop(user_id));
            if (act.equals("add")) {
                addNewCustomOrder(request, user_id);
            } else {
                updateProcess(request, user_id);
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
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

    private void addNewCustomOrder(HttpServletRequest request, int shop_id) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        int price = Integer.parseInt(request.getParameter("price"));
        Date deadline = Date.valueOf(request.getParameter("ecd"));
        OrdersDao.createCustomOrder(shop_id, price, productName, deadline);
    }

    private void updateProcess(HttpServletRequest request, int shop_id) throws ServletException, IOException {
        String order_id = request.getParameter("orderId");
        int orderId = Integer.parseInt(order_id);
        String upLoadDir = getUploadDir(orderId);
        String imgPath = null; String videoPath = null;
        Part img_part = request.getPart("productImg");
        Part video_part = request.getPart("productVideo");
        try {
            img_part.write(upLoadDir + "\\" + "img.png");
            imgPath = upLoadDir.replace(getServletContext().getRealPath(""), "") + "\\" + "img.png";
            imgPath = imgPath.replace("\\", "/");
            
            video_part.write(upLoadDir + "\\" + "video.mp4");
            videoPath = upLoadDir.replace(getServletContext().getRealPath(""), "") + "\\" + "video.mp4";
            
            videoPath = videoPath.replace("\\", "/");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        CustomOrderDetail cod = new CustomOrderDetail(orderId, imgPath, videoPath, description);
        OrdersDao.updateCustomOrderProcessDetai(cod, status);
    }

    private String getUploadDir(int order_id) throws IOException {
        String id = UUID.randomUUID().toString();
        // Create the directory structure if it doesn't exist
        String uploadPath = Paths.get(getServletContext().getRealPath(""), "img", "custom_order",
                String.valueOf(order_id), id.substring(0,6))
                .toString();
        while (Files.exists(Paths.get(uploadPath))) {            
            id = UUID.randomUUID().toString();
            uploadPath = Paths.get(getServletContext().getRealPath(""), "img", "custom_order",
                String.valueOf(order_id), id.substring(0,6))
                .toString();
        }
        if (!Files.exists(Paths.get(uploadPath))) {
            Files.createDirectories(Paths.get(uploadPath));
        }
        return uploadPath;
    }

}
