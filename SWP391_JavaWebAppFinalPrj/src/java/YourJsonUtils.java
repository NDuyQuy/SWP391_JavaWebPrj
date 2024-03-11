/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.CartItem;

import java.io.IOException;
import java.util.List;

public class YourJsonUtils {

    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static List<CartItem> convertJsonToCartItem(String json) {
        try {
            // Sử dụng Jackson ObjectMapper để chuyển đổi JSON thành danh sách CartItem
            return objectMapper.readValue(json, new TypeReference<List<CartItem>>() {});
        } catch (IOException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu có lỗi khi chuyển đổi
            return null;
        }
    }
}
  
}
