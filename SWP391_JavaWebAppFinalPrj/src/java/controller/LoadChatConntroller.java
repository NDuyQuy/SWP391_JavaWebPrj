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
public class LoadChatConntroller extends HttpServlet {

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
            
            
            if(action.equals("LoadChatList")) {
                ArrayList<Shops> chatList = MessageDao.GetChatList(userId);
                String chatListDiv = showChatList(chatList, userId);
                session.setAttribute("ChatList", chatListDiv);
                session.setAttribute("ShopList", chatList);
                out.println(chatListDiv);
            }
            else if(action.equals("LoadChat")) {
                int shop_id = Integer.parseInt(request.getParameter("shop_id"));
                String chatBoxDiv = showChatBox(shop_id, userId);
                session.setAttribute("ChatBoxContent", chatBoxDiv);
                out.println(chatBoxDiv);
            }
            else if(action.equals("LoadChatUnseen")) {
                int shop_id = Integer.parseInt(request.getParameter("shop_id"));
                String chatBoxDiv = showUnseenChat(shop_id, userId);
                session.setAttribute("ChatBoxContent", chatBoxDiv);
                out.println(chatBoxDiv);
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

    public String showChatList(ArrayList<Shops> chatList, int userId) {
        String element = new String();
        int i = 0;
        boolean b = true;
        while (i < chatList.size()) {
            String chatMember = "<li>\n" +
"                                    <div class=\"d-flex bd-highlight\" id=\"shopID_[shopId]\" onclick=\"changeChat([shopId])\">\n" +
"                                        \n" +
"                                        <!--IMAGE OF SENDER-->\n" +
"                                        <div class=\"img_cont\">\n" +
"                                            <img src=\"[shop_img]\" class=\"rounded-circle user_img\">\n" +
"                                        </div>\n" +
"                                        <div class=\"user_info\">\n" +
"                                            <!--NAME OF SENDER-->\n" +
"                                            <span>[chat_name]</span> \n" +
"                                            <!--MOST RECENT MESSAGE-->\n" +
"                                            <p>[recent_chat]</p>\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </li>\n";
            ArrayList<Messages> chat = MessageDao.GetMessageList(chatList.get(i).getShop_id(), userId);
            Messages recentChat = chat.get(chat.size() - 1);
            chatMember = chatMember.replace("[shop_img]", chatList.get(i).getShop_img());
            chatMember = chatMember.replace("[chat_name]", chatList.get(i).getShop_name());
            chatMember = chatMember.replace("[recent_chat]", recentChat.getContent());
            chatMember = chatMember.replace("[shopId]", Integer.toString(chatList.get(i).getShop_id()));
            element = element + chatMember;
            i++;
        }
        return element;
    }
    
    public String showChatBox(int shopId, int userId) {
        String element = new String();
        ArrayList<Messages> chat = MessageDao.GetMessageList(shopId, userId);
        int i = 0;
        MessageDao.SeenMessage(shopId, userId, 0);
        while (i < chat.size()) {
            String member = new String();
            int side = chat.get(i).getMessage_status();
            Timestamp t = chat.get(i).getTime_stamp();
            String time = t.toString().substring(0, 16);
            if (side == 1) {
                member = "<div class=\"d-flex justify-content-start mb-4\">\n" +
"                                <!--IMAGE OF SENDER-->\n" +
"                                <div class=\"img_cont_msg\">\n" +
"                                    <img src=\"[img]\" class=\"rounded-circle user_img_msg\">\n" +
"                                </div>\n" +
"                                <div class=\"msg_cotainer\" id=\"mid_[MessageID]\">\n" +
"                                    \n" +
"                                    <!--CONTENT OF MESSAGE-->\n" +
"                                    [Content]\n" +
"                                    \n" +
"                                    <!--TIME RECEIVE MESSAGE-->\n" +
"                                    <span class=\"msg_time\">[Time]</span>\n" +
"                                </div>\n" +
"                            </div>";
                member.replace("[img]", chat.get(i).getShop().getShop_img());
            }
            else if (side == 3) {
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
                member.replace("[img]", chat.get(i).getCustomer().getImg());
            }
            member.replace("[MessageID]", Integer.toString(chat.get(i).getMessage_id()));
            member.replace("[Content]", chat.get(i).getContent());
            member.replace("[Time]", time);
            element = element + member;
            i++;
        }
        element = element + "<div id=\"endOfChatBox\"></div>";
        return element;
    }
    
    public String showUnseenChat(int shopId, int userId) {
        String element = new String();
        ArrayList<Messages> chat = MessageDao.GetUnseenMessage(shopId, userId, 0);
        MessageDao.SeenMessage(shopId, userId, 0);
        int i = 0;
        while (i < chat.size()) {
            String member = new String();
            int side = chat.get(i).getMessage_status();
            Timestamp t = chat.get(i).getTime_stamp();
            String time = t.toString().substring(0, 16);
            if (side == 0) {
                member = "<div class=\"d-flex justify-content-start mb-4\">\n" +
"                                <!--IMAGE OF SENDER-->\n" +
"                                <div class=\"img_cont_msg\">\n" +
"                                    <img src=\"[img]\" class=\"rounded-circle user_img_msg\">\n" +
"                                </div>\n" +
"                                <div class=\"msg_cotainer\" id=\"mid_[MessageID]\">\n" +
"                                    \n" +
"                                    <!--CONTENT OF MESSAGE-->\n" +
"                                    [Content]\n" +
"                                    \n" +
"                                    <!--TIME RECEIVE MESSAGE-->\n" +
"                                    <span class=\"msg_time\">[Time]</span>\n" +
"                                </div>\n" +
"                            </div>";
                member.replace("[img]", chat.get(i).getShop().getShop_img());
            }
            member.replace("[MessageID]", Integer.toString(chat.get(i).getMessage_id()));
            member.replace("[Content]", chat.get(i).getContent());
            member.replace("[Time]", time);
            element = element + member;
            i++;
        }
        element = element + "<div id=\"endOfChatBox\"></div>";
        return element;
    }
    
    
    
    
}
