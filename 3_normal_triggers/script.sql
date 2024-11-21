-- Trigger to prevent negative inventory quantities
DELIMITER //
CREATE TRIGGER `TRG_CHECK_INVENTORY_QUANTITY` 
BEFORE UPDATE ON `Inventory`
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inventory quantity cannot be negative';
    END IF;
END;
//
DELIMITER ;

-- Trigger to enforce broiler age range
DELIMITER //
CREATE TRIGGER `TRG_ENFORCE_BROILER_AGE_RANGE`
BEFORE INSERT OR UPDATE ON `Poultry`
FOR EACH ROW
BEGIN
    IF NEW.breed = 'Broiler' AND (NEW.age < 42 OR NEW.age > 56) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Broiler age must be between 42 and 56 days';
    END IF;
END;
//
DELIMITER ;
-- Write your SQL code here
