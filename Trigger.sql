CREATE TRIGGER UpdateVoucherUseCount
ON orders
AFTER INSERT
AS
BEGIN
    DECLARE @voucher_id INT;
    -- Get the inserted voucher_id from the inserted table
    SELECT @voucher_id = inserted.voucher_id
    FROM inserted;

    -- Update the use_count in the vouchers table if voucher_id is not null
    IF (@voucher_id IS NOT NULL)
    BEGIN
        UPDATE vouchers
        SET use_count = use_count - 1 -- Assuming use_count is an integer column
        WHERE voucher_id = @voucher_id;
    END;
END;

CREATE TRIGGER UpdateProductQuantity
ON orderdetail
AFTER INSERT
AS
BEGIN
    DECLARE @p_detail_id INT;
    DECLARE @quantity INT;

    -- Get the inserted values from the inserted table
    SELECT @p_detail_id = inserted.p_detail_id,
           @quantity = inserted.quantity
    FROM inserted;

    -- Update the quantity in the product_detail table
    UPDATE product_detail
    SET quantity = quantity - @quantity
    WHERE id = @p_detail_id;
END;

