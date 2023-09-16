drop database if exists business;
create database business;
use business;

create table Engineer(
   empNO  tinyint primary key,
   name   varchar(20) not null,
   dept   char(4) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table service(
   serviceNO    tinyint primary key,
   serviceName  varchar(35)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 INSERT INTO engineer values(101,"Jim H", "ISTE");
 INSERT INTO engineer values(102,"Sue M", "BUS"); 
 INSERT INTO engineer values(103,"Rita S", "CS");
 INSERT INTO engineer values(104,"Dawn W", "HR");
 
 INSERT INTO service values(1,"Electrical Engineer");
 INSERT INTO service values(2,"Snow Removal");
 INSERT INTO service values(3,"Heating and cooling");
 INSERT INTO service values(4,"Grounds");
    
 create table engservice(
    empNO tinyint NOT NULL,
    serviceNO tinyint NOT NULL,
    PRIMARY KEY (empNO, serviceNO),
    CONSTRAINT engservice_engineer_FK FOREIGN KEY (empNO)
    REFERENCES engineer(empNO),
    CONSTRAINT engservice_service_FK FOREIGN KEY (serviceNO)
    REFERENCES service(serviceNO)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;;
  
  INSERT INTO engservice values(101,1);
  INSERT INTO engservice values(101,3);
  INSERT INTO engservice values(102,1);
  INSERT INTO engservice values(103,2);
  INSERT INTO engservice values(103,4);
  INSERT INTO engservice values(104,4);
  
  
  -- See who was hired to perform serviceNO 1
  SELECT ENGINEER.empNO,name,dept  FROM engineer JOIN engservice USING (empNO) 
                                                 JOIN service USING (serviceNO)
                                                 WHERE serviceNO = 1;
                                                 
  -- What services can Engineer # 103 Perform
  SELECT serviceNO, serviceName,name from service  JOIN engservice USING (serviceNO)
                                              JOIN engineer USING (empno)
                                              where engineer.empNO = 103;
  