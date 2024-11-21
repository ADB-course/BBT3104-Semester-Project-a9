-- Function to get average stock level for a specific poultry type
DELIMITER //
CREATE FUNCTION `GetAverageStockLevel` (IN poultryType VARCHAR(30)) 
RETURNS DECIMAL(5,2)
BEGIN
    DECLARE avg_stock DECIMAL(5,2);
    SELECT AVG(quantity) INTO avg_stock
    FROM `Inventory` I
    JOIN `Poultry` P ON I.poultry_id = P.poultry_id
    WHERE P.breed = poultryType;
    RETURN avg_stock;
END;
//
DELIMITER ;

-- Function to get total sales by poultry type
DELIMITER //
CREATE FUNCTION `GetTotalSalesByPoultryType` (IN poultryType VARCHAR(30)) 
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total_sales DECIMAL(10,2);
    SELECT SUM(S.sale_amount) INTO total_sales
    FROM `Sales` S
    JOIN `Inventory` I ON S.transaction_id = I.inventory_id
    JOIN `Poultry` P ON I.poultry_id = P.poultry_id
    WHERE P.breed = poultryType;
    RETURN total_sales;
END;
//
DELIMITER ;
-- Write your SQL code here
