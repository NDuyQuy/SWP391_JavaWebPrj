CREATE TRIGGER DeleteZeroQuantity
ON orderdetail
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM orderdetail
    WHERE quantity <= 0;
END;
