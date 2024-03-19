CREATE PROCEDURE SearchShippingUnitsByAddress
    @input_address NVARCHAR(MAX)
AS
BEGIN
    SELECT u.id, u.address, s.name, s.support_shippingmethod
    FROM users u
    JOIN shippingunits s ON u.id = s.id
    WHERE @input_address LIKE CONCAT('%', u.address, '%');
END;

EXEC SearchShippingUnitsByAddress @input_address = N'A,B,C,Đà Nẵng';
