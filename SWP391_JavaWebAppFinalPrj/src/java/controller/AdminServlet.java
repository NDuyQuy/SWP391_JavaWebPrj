/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import dao.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
/**
 *
 * @author DELL
 */
public class AdminServlet extends HttpServlet {

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
        String url = "/AdminMainpage.jsp";
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        boolean Continue = true;
        try {
            String action = request.getParameter("Action");
            if (action.equals("ViewCategory")) {
                ArrayList<Category> CategoryList = AdminDAO.Get_Category_List();
                if (CategoryList != null) {
                    session.setAttribute("CL", CategoryList);
                }
            }
            else if (action.equals("AddCategory")) {
                Continue = false;
                String Name = request.getParameter("categoryName");
                AdminDAO.Add_Main_Category(Name);
                url = "/AdminCategory.jsp";
            }
            else if(action.equals("EditCategory")){
                Continue = false;
                String Name = request.getParameter("categoryName");
                int id = Integer.parseInt(request.getParameter("categoryId"));
                AdminDAO.Update_Main_Category(id,Name);
                url = "/AdminCategory.jsp";
            }
        }
        catch (Exception e) {
            log("error at admin servlet: " + e.toString());
            System.out.println("Error While Loading...");
        }
        finally {
            if (!Continue) httpResponse.sendRedirect(httpRequest.getContextPath() + url);
            System.out.println("Loading...");
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