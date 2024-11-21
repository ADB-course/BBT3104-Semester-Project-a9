-- Add check constraints for Poultry Table
CREATE TABLE `Poultry` (
    `poultry_id` VARCHAR(20) NOT NULL,
    `breed` VARCHAR(30) NOT NULL,
    `acquisition_date` TIMESTAMP NOT NULL,
    `weight` DECIMAL(5,2) NOT NULL CHECK (weight > 0),
    `health_condition` ENUM('Healthy', 'Sick', 'Vaccinated') NOT NULL,
    PRIMARY KEY (`poultry_id`)
) ENGINE=InnoDB;

-- Add check constraints for Sales Table
CREATE TABLE `Sales` (
    `transaction_id` VARCHAR(15) PRIMARY KEY,
    `sale_date` TIMESTAMP NOT NULL CHECK (sale_date <= CURRENT_TIMESTAMP),
    `sale_amount` DECIMAL(10,2) NOT NULL CHECK (sale_amount > 0)
) ENGINE=InnoDB;
-- Write your SQL code here
