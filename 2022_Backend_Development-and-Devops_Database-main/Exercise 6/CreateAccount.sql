CREATE TABLE `shop`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
);

INSERT INTO `account` (`name`, `amount`) VALUES ("Savings", 100.00);
INSERT INTO `account` (`name`, `amount`) VALUES ("Checking", 2000.00);