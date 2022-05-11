DROP PROCEDURE IF EXISTS CreateOrder;

DELIMITER //

/*
- IN productID: The id of the purchased product
- IN customerID: The id of the customer who did the purchase
- IN employeeID: Id of the employee who sold the prodcut
- IN productCount: How many of this product is ordered
- OUT exitCode: Did the execution succeed or not
	- 0: Execution succeeded
	- 1: There was not enough products available
	- 2: Invalid customer id
	- 3: Invalid employee id
	- 4: Unknown error
*/
CREATE PROCEDURE CreateOrder(
	IN productID INT,
	IN customerID INT,
	IN employeeID INT,
	IN productCount INT,
	OUT exitCode INT
)
BEGIN

-- Declare all the variables at the beginning of the procedure
DECLARE productsAvailable INT DEFAULT 0;

-- Are we running the application in debug mode (development time -> true). Change the value to false when
-- you publish the application.
DECLARE isDebug BOOLEAN DEFAULT false;

-- Declare error hanlers here as well
-- https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/
-- https://mariadb.com/ja/resources/blog/improve-your-stored-procedure-error-handling-with-get-diagnostics/
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
	SET exitCode = 4;
	ROLLBACK;
END;

-- 1. Make sure there are enough products in the database to purchase the order
-- The result is stored in the productsAvailable variable
SELECT availability INTO productsAvailable
FROM products
WHERE id = productID;

IF productsAvailable >= productCount THEN
	CALL debug_msg(isDebug, "Enough products available, let's create an order");
	-- There are enough products available. Let's add a new order to the system
	START TRANSACTION;

	-- First create a new row to the orders table
	INSERT INTO orders (customer_id, employee_id) VALUES (customerID, employeeID);
	CALL debug_msg(isDebug, "Order created");

	INSERT INTO order_details(product_id, order_id, count)
		VALUES (productID, LAST_INSERT_ID(), productCount);
	CALL debug_msg(isDebug, "Order details added");

	UPDATE products SET availability=availability-productCount WHERE id=productID;
	CALL debug_msg(isDebug, "Product availability updated");

	-- Exit code 0 means that the operation succeeded. Remember to COMMIT!
	SET exitCode = 0;
	COMMIT;
ELSE
	SET exitCode = 1;
END IF;

END //

DELIMITER ;