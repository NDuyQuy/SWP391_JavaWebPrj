CREATE PROCEDURE GetOrderDetailsByOrderID
    @orderID INT
AS
BEGIN
    SELECT od.id AS order_detail_id,
           od.orderID,
           od.quantity AS order_quantity,
           od.cancel_reason,
           od.totalPrice AS order_total_price,

           pd.price AS productdetail_price,
           pd.name AS product_category,

           p.name AS product_name
    FROM orderdetail od
    JOIN product_detail pd ON od.p_detail_id = pd.id
    JOIN products p ON pd.product_id = p.product_id
    WHERE od.orderID = @orderID;
END;
