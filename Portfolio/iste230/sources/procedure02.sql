-- procedure02.sql   Created 4/22/2019 - coupon winners

-- A transaction has the following properties:
--	Atomic - the transaction cannot be subdivided and, therefore
--               it must be processed in its entirety or not at all!
--	Consistency
--	Isolation
--	Durability

use jrhicsa;

drop procedure if EXISTS procedure02;

delimiter //
CREATE PROCEDURE procedure02()
   BEGIN
	START TRANSACTION;
	
SELECT distinct concat(students.Name,'  ', students.Email) 
As 'Student', 
SUM(winners.StartOfClassWin)+
SUM(winners.EndOfClassWin)+
SUM(winners.RandomHatDrawingWin) AS 'Extra_Credit_Points' 
FROM winners JOIN students using(Email) 
WHERE students.Course LIKE 'ISTE230.02' 
group by winners.Email order by students.Course, students.Name;	
	
	
	
	SELECT @records:=count(email) FROM winners;
	
	select if (@records < 0, "Negative - Error!", "Positive");
	
	IF @records < 0 THEN
	    ROLLBACK;
	ELSE
	    COMMIT;
        END IF;
   END;
//
delimiter ;

-- call procedure02();  
   
-- SELECT @records as "Number_Of_Coupons_given";