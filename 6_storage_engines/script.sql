-- Poultry Table
CREATE TABLE `Poultry` (
    `poultry_id` VARCHAR(20) NOT NULL,
    `breed` VARCHAR(50) NOT NULL,
    `age` INT NOT NULL,
    `acquisition_date` TIMESTAMP NOT NULL,
    `weight` DECIMAL(5, 2) NOT NULL,
    `health_condition` ENUM('Healthy', 'Sick', 'Vaccinated') NOT NULL,
    `supplier_id` INT,
    PRIMARY KEY (`poultry_id`),
    FOREIGN KEY (`supplier_id`) REFERENCES `Suppliers`(`supplier_id`)
) ENGINE=InnoDB;

-- Suppliers Table
CREATE TABLE `Suppliers` (
    `supplier_id` INT AUTO_INCREMENT NOT NULL,
    `business_name` VARCHAR(50) NOT NULL,
    `contact_number` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`supplier_id`),
    UNIQUE (`business_name`),
    UNIQUE (`contact_number`)
) ENGINE=InnoDB;

-- Sales Table
CREATE TABLE `Sales` (
    `transaction_id` VARCHAR(15) NOT NULL,
    `sale_date` TIMESTAMP NOT NULL,
    `sale_amount` DECIMAL(10, 2) NOT NULL,
    `poultry_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`transaction_id`),
    FOREIGN KEY (`poultry_id`) REFERENCES `Poultry`(`poultry_id`)
) ENGINE=InnoDB;

-- Inventory Table
CREATE TABLE `Inventory` (
    `inventory_id` INT AUTO_INCREMENT NOT NULL,
    `poultry_id` VARCHAR(20) NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`inventory_id`),
    FOREIGN KEY (`poultry_id`) REFERENCES `Poultry`(`poultry_id`)
) ENGINE=InnoDB;

-- Employees Table
CREATE TABLE `Employees` (
    `employee_id` INT AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`employee_id`),
    UNIQUE (`email`)
) ENGINE=InnoDB;

-- BiosecurityLogs Table (for health check details)
CREATE TABLE `BiosecurityLogs` (
    `log_id` INT AUTO_INCREMENT NOT NULL,
    `bird_id` VARCHAR(20) NOT NULL,
    `employee_id` INT NOT NULL,
    `check_date` TIMESTAMP NOT NULL,
    `health_condition` ENUM('Healthy', 'Sick', 'Vaccinated') NOT NULL,
    PRIMARY KEY (`log_id`),
    FOREIGN KEY (`bird_id`) REFERENCES `Poultry`(`poultry_id`),
    FOREIGN KEY (`employee_id`) REFERENCES `Employees`(`employee_id`)
) ENGINE=InnoDB;
-- Write your SQL code here
