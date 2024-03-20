CREATE PROCEDURE GetTotalProductSell
@ShopId INT, @Month INT, @Year INT
AS
BEGIN
	SELECT SUM(od.quantity) as [totalProductQuantity] 
	FROM [orders] o JOIN orderdetail od ON o.order_id = od.orderID
	WHERE [shop_id] = @ShopId 
	AND MONTH(order_date) = @Month 
	AND YEAR(order_date) = @Year 
	AND [status] = N'đã nhận'
	AND [cancel_reason] IS NULL
END
