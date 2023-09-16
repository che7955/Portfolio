
SELECT courseDesc, collegeName  FROM COLLEGE 
                              JOIN Department USING(CollegeID) 
                              JOIN Course using (deptNUM);
                              
-- The following select statement will produce the same results

SELECT courseDesc, collegeName  FROM Course 
                                JOIN Department  using (deptNum)
                                JOIN College using (collegeID);
                                
                
                
SELECT distinct Course.courseDesc, College.collegeName FROM Course 
                               JOIN Department ON Course.deptNum = Department.deptNum
                               JOIN College ON Department.collegeID = College.collegeID
                               WHERE department.deptName LIKE "%Electrical%";
