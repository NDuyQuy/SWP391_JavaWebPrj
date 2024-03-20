/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.MessageDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Messages;
import model.Shops;
import model.Users;

/**
 *
 * @author DELL
 */
public class ChatController extends HttpServlet {

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
        String url = "/chat.jsp";
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = request.getSession();
        try {
            PrintWriter out = response.getWriter();
            String action = request.getParameter("Action");
            Users u = (Users)session.getAttribute("user");
            int userId = u.getId();
            
            
            if(action.equals("SendChat")) {
                int shop_id = Integer.parseInt(request.getParameter("shop_id"));
                String message = request.getParameter("messageText");
                MessageDao.SendMessage(shop_id, userId, 2, message);
                String chatDiv = ShowSendChat(message, shop_id, userId);
                out.println(chatDiv);
            }
        }
        catch (Exception ex) {
            System.out.println("Error While Loading...");
        }
        finally {
            //httpResponse.sendRedirect(httpRequest.getContextPath() + url);
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
    
    public String ShowSendChat(String content, int shopId, int userId) {
        String member = new String();
        ArrayList<Messages> chat = MessageDao.GetMessageList(shopId, userId);
        Timestamp t = chat.get(chat.size() - 1).getTime_stamp();
        String time = t.toString().substring(0, 16);
        member = "<div class=\"d-flex justify-content-end mb-4\">\n" +
"                                <div class=\"msg_cotainer_send\" id=\"mid_[MessageID]\">\n" +
"                                    \n" +
"                                    <!--CONTENT OF MESSAGE-->\n" +
"                                    [Content]\n" +
"                                    \n" +
"                                    <!--TIME SEND MESSAGE-->\n" +
"                                    <span class=\"msg_time_send\">[Time]</span>\n" +
"                                </div>\n" +
"                                <!--IMAGE OF RECEIVER-->\n" +
"                                <div class=\"img_cont_msg\">\n" +
"                                    <img src=\"[img]\" class=\"rounded-circle user_img_msg\">\n" +
"                                </div>\n" +
"                            </div>";
        member.replace("[img]", chat.get(chat.size() - 1).getCustomer().getImg());
        member.replace("[MessageID]", Integer.toString(chat.get(chat.size() - 1).getMessage_id()));
        member.replace("[Content]", chat.get(chat.size() - 1).getContent());
        member.replace("[Time]", time);
        member = member + "<div id=\"endOfChatBox\"></div>";
        return member;
    }
    
}
