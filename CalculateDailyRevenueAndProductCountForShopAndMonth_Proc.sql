CREATE PROCEDURE [dbo].[CalculateDailyRevenueAndProductCountForShopAndMonth]
    @ShopID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Create a temporary table to store daily revenue and product count
    CREATE TABLE #DailyRevenueAndProductCount (
        RevenueDate DATE,
        TotalRevenue DECIMAL(18, 2),
        TotalQuantitySold INT,
        UniqueProductCount INT
    );

    -- Populate the temporary table with daily revenue and product count data
    DECLARE @StartDate DATE = DATEFROMPARTS(@Year, @Month, 1);
    DECLARE @EndDate DATE = DATEADD(DAY, -1, DATEADD(MONTH, 1, @StartDate));

    WHILE @StartDate <= @EndDate
    BEGIN
        DECLARE @DailyRevenue DECIMAL(18, 2);
        DECLARE @TotalQuantitySold INT;
        DECLARE @UniqueProductCount INT;

        SELECT @DailyRevenue = SUM(od.totalPrice - od.totalPrice * 0.1),
               @TotalQuantitySold = SUM(od.quantity),
               @UniqueProductCount = COUNT(DISTINCT pd.product_id)
        FROM orders o
        JOIN orderdetail od ON o.order_id = od.orderID
        JOIN product_detail pd ON od.p_detail_id = pd.id
        WHERE od.cancel_reason IS NULL
            AND o.status = N'đã nhận' 
            AND o.shop_id = @ShopID -- Filter by shop_id
            AND CONVERT(DATE, o.order_date) = @StartDate;

        INSERT INTO #DailyRevenueAndProductCount (RevenueDate, TotalRevenue, TotalQuantitySold, UniqueProductCount)
        VALUES (@StartDate, @DailyRevenue, @TotalQuantitySold, @UniqueProductCount);

        SET @StartDate = DATEADD(DAY, 1, @StartDate);
    END;

    -- Return the result set sorted by day
    SELECT * FROM #DailyRevenueAndProductCount ORDER BY RevenueDate;

    -- Drop the temporary table
    DROP TABLE #DailyRevenueAndProductCount;
END;


EXEC [CalculateDailyRevenueAndProductCountForShopAndMonth] @ShopID = 1, @Month = 2, @Year=2024