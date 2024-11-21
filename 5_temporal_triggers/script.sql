-- Trigger to update poultry age daily
DELIMITER //
CREATE TRIGGER `TRG_UPDATE_POULTRY_AGE` 
AFTER UPDATE ON `Poultry`
FOR EACH ROW
BEGIN
    UPDATE `Poultry` 
    SET age = age + 1 
    WHERE `poultry_id` = OLD.poultry_id;
END;
//
DELIMITER ;

-- Trigger to monitor weekly feed consumption
DELIMITER //
CREATE TRIGGER `TRG_MONITOR_FEED_CONSUMPTION` 
AFTER INSERT ON `FeedConsumption`
FOR EACH ROW
BEGIN
    INSERT INTO `FeedConsumptionStats` (average_feed_per_bird) 
    VALUES (SELECT AVG(feed_amount) FROM `FeedConsumption` WHERE WEEK(feed_date) = WEEK(CURRENT_DATE));
END;
//
DELIMITER ;
-- Write your SQL code here
