# Instructions
In this exercise we practise writing stored procedures and indices. Tasks are longer and more difficult than tasks earlier but there is more time to do these and these tasks grant you more points.

For tasks one and two you need the following tables and data:
```sql
CREATE TABLE `shop`.`account` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
);

INSERT INTO `account` (`name`, `amount`) VALUES ("Savings", 100.00);
INSERT INTO `account` (`name`, `amount`) VALUES ("Checking", 2000.00);
```

## Scoring
* Task 1: 2 points
* Task 2: 4 points
* Task 3: 4 points
* Task 4: 2 points