-- Database transaction to update poultry health condition
DELIMITER //
CREATE PROCEDURE `updatePoultryHealth`(IN birdID VARCHAR(20), IN employeeID INT, IN checkDate TIMESTAMP, IN healthCondition ENUM('Healthy', 'Sick', 'Vaccinated'))
BEGIN
    DECLARE current_health ENUM('Healthy', 'Sick', 'Vaccinated');

    -- Start a transaction
    START TRANSACTION;

    -- Check if the bird exists
    SELECT health_condition INTO current_health 
    FROM `Poultry` 
    WHERE poultry_id = birdID FOR UPDATE;

    IF current_health IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bird not found';
    END IF;

    -- Check if the employee exists
    IF NOT EXISTS (SELECT 1 FROM `Employees` WHERE employee_id = employeeID) THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid employee ID';
    END IF;

    -- Update the health condition
    UPDATE `Poultry`
    SET health_condition = healthCondition
    WHERE poultry_id = birdID;

    -- Log the check details in BiosecurityLogs
    INSERT INTO `BiosecurityLogs` (bird_id, employee_id, check_date, health_condition)
    VALUES (birdID, employeeID, checkDate, healthCondition);

    -- If sick, notify biosecurity team and flag affected stock
    IF healthCondition = 'Sick' THEN
        UPDATE `Inventory` 
        SET flagged_for_treatment = TRUE 
        WHERE poultry_id = birdID;
    END IF;

    -- Commit the transaction
    COMMIT;
END;
//
DELIMITER ;
-- Write your SQL code here
