-- Procedure to calculate total revenue for a given month and year
DELIMITER //
CREATE PROCEDURE `CalculateMonthlyRevenue` (IN month INT, IN year INT)
BEGIN
    SELECT SUM(sale_amount) AS `total_revenue`
    FROM `Sales`
    WHERE MONTH(sale_date) = month AND YEAR(sale_date) = year;
END;
//
DELIMITER ;

-- Write your SQL code here
