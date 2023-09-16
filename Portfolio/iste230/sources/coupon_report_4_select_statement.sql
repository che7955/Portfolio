SELECT distinct concat(students.Name,'  ', students.Email) As 'Student',
 SUM(winners.StartOfClassWin)+SUM(winners.EndOfClassWin)+SUM(winners.RandomHatDrawingWin) AS 'Extra Credit Points' 
   FROM winners JOIN students using(Email)
       WHERE students.Course LIKE 'ISTE230.02'
          group by winners.Email
              order by students.Course, students.Name;
