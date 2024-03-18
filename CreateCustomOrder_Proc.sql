CREATE PROCEDURE CREATECUSTOMORDERS
@ShopId Int, @Price Money, @ProductName NVarChar(50), @Deadline Date
AS
BEGIN
	DECLARE @OrderId Int
	INSERT INTO [orders]([shop_id],[total],[status],[type]) 
	VALUES (@ShopId,@Price,'WAC',2)
	SELECT @OrderId = SCOPE_IDENTITY();
	INSERT INTO [custom_order]
	VALUES (@OrderId,@ProductName, @Deadline)
END

EXEC CREATECUSTOMORDERS @ShopId = 1, @Price=100000,@ProductName=N'Anima thú bông làm tay', @Deadline = '2024/04/10'