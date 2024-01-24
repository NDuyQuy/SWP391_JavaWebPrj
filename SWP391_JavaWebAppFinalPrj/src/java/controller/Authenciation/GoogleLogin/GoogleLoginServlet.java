/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Authenciation.GoogleLogin;

import com.google.gson.JsonObject;
import dao.UsersDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author LENOVO
 */
public class GoogleLoginServlet extends HttpServlet {

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
        String code = request.getParameter("code");
        String accessToken = GoogleSupport.getToken(code);
        System.out.println("Access Token: " + accessToken);
        JsonObject userInfo = GoogleSupport.getUserInfo(accessToken);
        // Lấy thông tin từ Google
        String email = userInfo.get("email").getAsString();
        String fullname = userInfo.get("name").getAsString();
        if (!UsersDao.isGoogleUser(email)) {
            // Nếu tài khoản chưa đăng nhập bằng Google, thực hiện lưu thông tin vào database
            UsersDao.insertGoogleUser(email, fullname);
        }
        Boolean verify_email = userInfo.get("verified_email").getAsBoolean();
        String url = "";
        if (verify_email) {
            User u = UsersDao.getUserInfoByEmail(email);
            request.getSession().setAttribute("user", u);
            int role = u.getRole();
            //switch the url 
            switch (role) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
            }
            url = "/home.jsp";
        } else {
            url = "/login.jsp";
        }

        // Tạo JsonObject mới chỉ chứa email và name
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("email", email);
        responseJson.addProperty("name", fullname);
        request.getRequestDispatcher(url).forward(request, response);

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

}
