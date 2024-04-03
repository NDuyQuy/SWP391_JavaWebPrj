-- Generate sample data for order_detail table
DECLARE @counter INT = 0;

WHILE @counter < 15
BEGIN
    DECLARE @orderID INT = @counter % 10; -- orderID ranging from 0 to 9
    DECLARE @quantity INT = RAND() * (3 - 1 + 1) + 1; -- Random quantity between 1 and 3
    DECLARE @p_detail_id INT = FLOOR(RAND() * (17 - 15 + 1)) + 15; -- Random p_detail_id between 15 and 17

    INSERT INTO orderdetail (orderID, quantity, totalPrice, p_detail_id)
    VALUES (@orderID, @quantity, 390000.00, @p_detail_id);

    SET @counter = @counter + 1;
END;

-- Insert data for orderId 11
INSERT INTO orderdetail (orderID, quantity, totalPrice, p_detail_id)
VALUES (10, 2, 390000.00, 15);

