-- Indexes for Poultry Table
CREATE INDEX idx_breed ON `Poultry`(`breed`);
CREATE INDEX idx_acquisition_date ON `Poultry`(`acquisition_date`);

-- Indexes for Suppliers Table
CREATE UNIQUE INDEX idx_contact_number ON `Suppliers`(`contact_number`);
CREATE UNIQUE INDEX idx_business_name ON `Suppliers`(`business_name`);

-- Indexes for Sales Table
CREATE UNIQUE INDEX idx_transaction_id ON `Sales`(`transaction_id`);
CREATE INDEX idx_sale_date ON `Sales`(`sale_date`);

-- Indexes for Inventory Table
CREATE INDEX idx_poultry_id ON `Inventory`(`poultry_id`);
CREATE INDEX idx_quantity ON `Inventory`(`quantity`);

-- Indexes for Employees Table
CREATE UNIQUE INDEX idx_email ON `Employees`(`email`);
CREATE INDEX idx_first_name ON `Employees`(`first_name`);

-- Indexes for BiosecurityLogs Table (assuming this table exists for recording health check details)
CREATE INDEX idx_bird_id ON `BiosecurityLogs`(`bird_id`);
CREATE INDEX idx_employee_id ON `BiosecurityLogs`(`employee_id`);
CREATE INDEX idx_check_date ON `BiosecurityLogs`(`check_date`);

-- Additional Composite Indexes (where applicable)
-- Optimize queries joining Poultry and Inventory
CREATE INDEX idx_inventory_poultry ON `Inventory`(`poultry_id`);

-- Optimize queries joining Poultry and Suppliers
CREATE INDEX idx_poultry_supplier ON `Poultry`(`supplier_id`);

-- Optimize queries joining Sales and Inventory
CREATE INDEX idx_sales_inventory ON `Sales`(`transaction_id`);
-- Write your SQL code here
