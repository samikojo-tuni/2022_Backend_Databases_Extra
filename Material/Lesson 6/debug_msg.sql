-- Copied from https://stackoverflow.com/questions/273437/how-do-you-debug-mysql-stored-procedures
DELIMITER //

DROP PROCEDURE IF EXISTS `debug_msg`//

CREATE PROCEDURE debug_msg(
	IN enabled INTEGER,
	IN msg VARCHAR(255))
BEGIN

IF enabled THEN
SELECT concat('** ', msg) AS '** DEBUG:';

END IF;

END //

DELIMITER ;