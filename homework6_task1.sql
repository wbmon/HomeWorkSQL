 DROP DATABASE IF EXISTS homework6;
 
 CREATE DATABASE homework6;
 USE homework6;
 
 /* 1)	Создайте процедуру, которая принимает кол-во сек и формат их в кол-во дней часов.
		Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
   ______________________________________________________________________________________
*/ 

DROP PROCEDURE IF EXISTS format_date;
DELIMITER //
CREATE PROCEDURE format_date
(
	IN number INT,
    OUT text_format_date VARCHAR(100)
)

BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
		
    SET text_format_date = "";     
    
    If number > 0 THEN
		SET days = FLOOR(number / (24 * 60 * 60));
        SET number = number - days * 24 * 60 * 60;
	END IF;
    
    If number > 0 THEN
		SET hours = FLOOR(number / (60 * 60));
        SET number = number - hours * 60 * 60;
    END IF;    
    
    If number > 0 THEN
		SET minutes = FLOOR(number / 60);
        SET number = number - minutes * 60;
	END IF;
     
	If number > 0 THEN 
		SET seconds = number;
	END IF;
    
    IF days > 0 THEN
		SET text_format_date = concat(text_format_date, concat(days, " days,"), "  ");
	END IF;
    
    IF hours > 0 THEN
		SET text_format_date = concat(text_format_date, concat(hours, " hours,"), "  ");
	END IF;
    
    IF minutes > 0 THEN
		SET text_format_date = concat(text_format_date, concat(minutes, " minutes,"), "  ");
	END IF;
    
    IF seconds > 0 THEN
		SET text_format_date = concat(text_format_date, concat(seconds, " seconds."), "  ");
	END IF;
    
END//

CALL format_date(123456, @res);
SELECT @res;