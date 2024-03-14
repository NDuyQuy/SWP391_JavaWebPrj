/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author ASUS
 */
public class OrdersDao {
    private static final String GETORDERSBYSHOP = "SELECT * FROM [orders] WHERE [shop_id]=?";
    private static final String CREATECUSTOMORDER = "INSERT INTO [orders]([shop_id],[total],[status],[type]) VALUES (?,?,'wait for customer accept',?)";
    private static final String ACCEPTCUSTOMORDER = "UPDATE [orders] set [status]='', ";
    
}
