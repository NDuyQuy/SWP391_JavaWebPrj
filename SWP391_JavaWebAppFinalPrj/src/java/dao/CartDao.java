package dao;

public interface CartDao {
    
   void addToCart(int userId, int productId, int quantity);

    void updateCartItemQuantity(int userId, int productId, int quantityChange);

    void removeFromCart(int userId, int productId);

    void clearCart(int userId);
}

