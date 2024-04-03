/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrdersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "ReturnRequestServlet", urlPatterns = {"/ReturnRequestServlet"})

@MultipartConfig
public class ReturnRequestServlet extends HttpServlet {

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
            out.println("<title>Servlet ReturnRequestServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReturnRequestServlet at " + request.getContextPath() + "</h1>");
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

        int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));

        request.setAttribute("orderDetailId", orderDetailId);

        RequestDispatcher dispatcher = request.getRequestDispatcher("refundreturnrequest.jsp");
        dispatcher.forward(request, response);

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
        int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));
        String cancelReason = request.getParameter("cancelReason");
        String upLoadDir = getUploadDir(orderDetailId);
        String imgPath = null;
        Part img_part = request.getPart("productImg");
        try {
            img_part.write(upLoadDir + "\\" + "img.png");
            imgPath = upLoadDir.replace(getServletContext().getRealPath(""), "") + "\\" + "img.png";
            imgPath = imgPath.replace("\\", "/");

        } catch (IOException e) {
            e.printStackTrace();
        }
        boolean success = OrdersDao.requestReturn(orderDetailId, cancelReason, imgPath);

        if (success) {

            response.sendRedirect("OrderListController");
        } else {

            response.sendRedirect("return_error.jsp");
        }
    }

    private String getUploadDir(int order_id) throws IOException {
        String id = UUID.randomUUID().toString();
        // Create the directory structure if it doesn't exist
        String uploadPath = Paths.get(getServletContext().getRealPath(""), "img",
                String.valueOf(order_id), id.substring(0, 6))
                .toString();
        while (Files.exists(Paths.get(uploadPath))) {
            id = UUID.randomUUID().toString();
            uploadPath = Paths.get(getServletContext().getRealPath(""), "img",
                    String.valueOf(order_id), id.substring(0, 6))
                    .toString();
        }
        if (!Files.exists(Paths.get(uploadPath))) {
            Files.createDirectories(Paths.get(uploadPath));
        }
        return uploadPath;
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
