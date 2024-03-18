CREATE PROCEDURE CalculateTotalRevenueForShopAndMonth
    @ShopID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @TotalRevenue DECIMAL(18, 2);

SELECT  @TotalRevenue = SUM(total_price - discount_amount - total_price * 0.1)
    FROM (
        SELECT 
            o.order_id, 
            SUM(od.totalPrice) AS total_price,
            COALESCE(v.discount_amount, 0) AS discount_amount
        FROM 
            orders o
        JOIN 
            orderdetail od ON o.order_id = od.orderID
        LEFT JOIN 
            vouchers v ON o.voucher_id = v.voucher_id
        WHERE 
            od.cancel_reason IS NULL
            AND (v.type = 1 OR v.type = 2 OR o.voucher_id IS NULL)
            AND o.status = N'đã nhận' -- Add condition for order status
            AND o.shop_id = @ShopID -- Filter by shop_id
            AND MONTH(o.order_date) = @Month -- Filter by month
            AND YEAR(o.order_date) = @Year -- Filter by year
        GROUP BY 
            o.order_id, o.voucher_id,discount_amount
    ) AS order_revenue;
	SELECT @TotalRevenue AS TotalRevenue;
END;