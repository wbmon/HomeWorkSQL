 DROP DATABASE IF EXISTS homework6;
 
 CREATE DATABASE homework6;
 USE homework6;
 

 /* 2)	Создайте функцию, которая выводит только четные числа от 1 до 10.
		Пример: 2,4,6,8,10 
   ______________________________________________________________________
*/ 

DROP FUNCTION IF EXISTS even_numbers;
DELIMITER //
CREATE FUNCTION even_numbers()
RETURNS VARCHAR(50) DETERMINISTIC 
BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE initial_value INT DEFAULT 1;
	DECLARE final_value INT DEFAULT 10;
    DECLARE n INT DEFAULT 0;
	SET n = IF(initial_value % 2 = 0, initial_value, initial_value + 1);
	IF n <= final_value THEN 
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, ",");
            END IF;
			SET result = CONCAT(result, n);
			SET n = n + 2;
			UNTIL n > final_value
		END REPEAT;
	END IF;
	RETURN result;
END//

SELECT even_numbers();