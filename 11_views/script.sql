-- View for sales summary by poultry type
CREATE VIEW `VwSalesSummary` AS
SELECT P.breed, SUM(S.sale_amount) AS `total_sales`, COUNT(S.transaction_id) AS `total_quantity`
FROM `Sales` S
JOIN `Poultry` P ON S.transaction_id = P.poultry_id
GROUP BY P.breed;

-- View for employee shift report
CREATE VIEW `VwEmployeeShiftReport` AS
SELECT E.first_name, E.email, SUM(W.hours_worked) AS `total_hours`
FROM `Employees` E
JOIN `WorkShifts` W ON E.employee_id = W.employee_id
GROUP BY E.employee_id;

-- View for inventory status
CREATE VIEW `VwInventoryStatus` AS
SELECT I.poultry_id, P.breed, I.quantity, S.business_name
FROM `Inventory` I
JOIN `Poultry` P ON I.poultry_id = P.poultry_id
JOIN `Suppliers` S ON P.supplier_id = S.supplier_id;

-- View for client purchase history
CREATE VIEW `VwClientPurchaseHistory` AS
SELECT C.client_id, SUM(S.sale_amount) AS `total_purchases`, MAX(S.sale_date) AS `last_purchase_date`
FROM `Sales` S
JOIN `Clients` C ON S.client_id = C.client_id
GROUP BY C.client_id;
-- Write your SQL code here
