/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//import static jdk.nashorn.internal.runtime.regexp.joni.constants.AsmConstants.S;
import model.Users;

/**
 *
 * @author ASUS
 */
@MultipartConfig
public class ProfileController extends HttpServlet {

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
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-speciWfic error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String fname = request.getParameter("fname");
            String addr = request.getParameter("addr");
            String phone = request.getParameter("phone");
            Users u =((Users) request.getSession().getAttribute("user"));
            //Change user data
            u.setFullname(fname);u.setAddress(addr);u.setPhone(phone);
            Part p = request.getPart("avatar");
            String uploadDir = null;
            if(p!=null){  
                if(p.getSize()>0){
                    uploadDir = getDir(u.getId())+"\\avatar.jpg";
                    p.write(uploadDir);
                }
            }
            if(uploadDir!=null){
                uploadDir = uploadDir.replace(getServletContext().getRealPath(""), "");
                uploadDir = uploadDir.replaceAll("\\\\", "/");
                u.setImg(uploadDir);
            }
            UsersDao.updateProfile(u);
            //Add user again into session
            request.getSession().setAttribute("user", u);
            //forward again profile
            request.getRequestDispatcher("/profile.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("session_out", "Phiên làm việc của bạn đã hết hạn. Vui lòng đăng nhập lại");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        String uploadPath = Paths.get(getServletContext().getRealPath(""),"img", "users","user_avatar",String.valueOf(user_id)).toString();
        // IF DIR EXISTS RANDOM AGAIN TO UNTIL DIR DONT EXISTS
        if(!Files.exists(Paths.get(uploadPath))) Files.createDirectories(Paths.get(uploadPath));
        else Files.delete(Paths.get(uploadPath,"avatar.jpg"));
        return uploadPath;
    }
}
