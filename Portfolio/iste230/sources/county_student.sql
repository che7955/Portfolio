# Updated 4/11/2018

DROP DATABASE IF EXISTS County;
CREATE DATABASE County;

USE County;

CREATE TABLE Contact (
contactID int(5) NOT NULL,
firstname varchar(20),
middleinitial varchar(1),
lastname varchar(20),
suffix_description varchar(10),
title_description varchar(25),
jobtitle varchar(25),
department varchar(25),
email varchar(40),
url varchar(50),
IMaddress varchar(25),
birthday date,
notes varchar(100),
co_worker tinyint UNSIGNED,
vendor tinyint UNSIGNED,
Personal tinyint UNSIGNED,
companyname varchar(20),
Primary Key (contactID)
);

INSERT INTO Contact values(10008,"Bill","R","Miller","Mr.","Mechanical Engineer",
null,null,"bill.miller@gmail.com",
  null,null,"1954-04-21",null,0,0,1,null);
  
CREATE TABLE TelephoneInfo (
phone_number varchar(14) NOT NULL,
phonetype_description varchar (25),
PRIMARY KEY (phone_number)
);

Create table ContactNumber (
contactID int(5) NOT NULL,
phone_number varchar(14) NOT NULL,
PRIMARY KEY (contactID, phone_number)
);

ALTER TABLE ContactNumber ADD FOREIGN KEY(contactID) REFERENCES Contact(contactID);
ALTER TABLE ContactNumber ADD FOREIGN KEY(phone_number) REFERENCES TelephoneInfo(phone_number);

-- Insert data into countydb

INSERT INTO Contact VALUES
('10001','Mary','E','Smith','Mrs',null,'Clerk','Finance','Mary.Smith@county.ny.us','www.fakecounty.ny.us','Mary.Smith','1960-06-22',null,1,null,null,'Genesee County');
INSERT INTO Contact VALUES
('10002','Jim','T','Martin','Mr',null,'Director','Finance','Jim.Martin@county.ny.us','www.fakecounty.ny.us','Jim.Martin','1954-08-19',null,1,null,null,'Genesee County');
INSERT INTO County.Contact (contactID, firstname, lastname, suffix_description, title_description, jobtitle, email, url, Birthday, co_worker, companyname) VALUES ('10003', 'Jim', 'Bucki', 'Mr.', 'Java Programmer', 'Programmer', 'JMBucki@xyzcounty.com', 'www.exzcounty.ny.us', '1962-04-28', '1','GCC');
INSERT INTO County.Contact (contactID, firstname, middleinitial, lastname, suffix_description, title_description, jobtitle, department, email, url, birthday, co_worker, Personal,companyname) VALUES ('10004', 'Elissa', '', 'Weeden', 'Mrs.', 'RIT Professor', 'DBMA', 'IST', 'eweeden@yahoo.com', 'http://www.ist.rit.edu/people/people.php', '1975-08-08', '1', '1','RIT');
INSERT INTO County.Contact (contactID, firstname, middleinitial, lastname, suffix_description, title_description, department, email, url, birthday, co_worker, Personal,companyname) VALUES ('10005', 'Jim', 'R', 'Habermas', 'Mr.', 'Lecturer', 'IST', 'jrhabermas@gmail.com', 'http://jimhabermas.com', '1962-04-28', 1, 1,'RIT');
INSERT INTO County.Contact (contactID, firstname, lastname, suffix_description, title_description, jobtitle, email, birthday, Personal, companyname) VALUES ('10006', 'Bill', 'Streetman', 'Mr.', 'Engineer', 'Engineer', 'bstreetman@yahoo.com', '1957-04-20', '1', 'GE');
INSERT INTO `County`.`Contact` (`contactID`, `firstname`, `lastname`, `suffix_description`, `email`, `Personal`) VALUES ('10007', 'Kevin', 'Jackson', 'Mr.', 'kjackson@rochester.rr.com', '1');

INSERT INTO TelephoneInfo VALUES ('555-215-6102','Home Phone');
INSERT INTO TelephoneInfo VALUES ('555-615-3152','Cell Phone');
INSERT INTO TelephoneInfo VALUES ('123-455-7453','Office Phone');
INSERT INTO TelephoneInfo VALUES ('452-741-1234','Home Phone');
INSERT INTO TelephoneInfo VALUES ('957-126-6556','Cell Phone');
INSERT INTO TelephoneInfo VALUES ('125-953-1122','Office Phone');
INSERT INTO TelephoneInfo VALUES ('585-343-0055','Office Phone');
INSERT INTO TelephoneInfo VALUES ('585-475-9999','Office Phone');
INSERT INTO TelephoneInfo VALUES ('585-746-9999','Cell Phone');

INSERT INTO ContactNumber VALUES ('10001','555-215-6102');
INSERT INTO ContactNumber VALUES ('10001','555-615-3152');
INSERT INTO ContactNumber VALUES ('10001','123-455-7453');
INSERT INTO ContactNumber VALUES ('10002','452-741-1234');
INSERT INTO ContactNumber VALUES ('10002','957-126-6556');
INSERT INTO ContactNumber VALUES ('10002','125-953-1122');
INSERT INTO ContactNumber VALUES ('10003','585-343-0055');
INSERT INTO ContactNumber VALUES ('10004','585-475-9999');
INSERT INTO ContactNumber VALUES ('10005','585-746-9999');

 SELECT lastname,firstname, phone_number, phonetype_description 
   FROM Contact
   Join ContactNumber using (contactid)
   Join TelephoneInfo using (phone_number);

SELECT * FROM Contact;
SELECT * FROM TelephoneInfo;
SELECT * FROM ContactNumber;

SELECT firstname AS 'First Name', lastname AS 'Last Name', 
TelephoneInfo.phone_number AS 'Phone Number',
phonetype_description AS 'Phone Type' 
FROM Contact,ContactNumber,TelephoneInfo where 
ContactNumber.phone_number=TelephoneInfo.phone_number 
and Contact.contactID=ContactNumber.contactID;

select contactID, firstname AS 'First Name', lastname AS 'Last Name', TelephoneInfo.phone_number AS 'Phone Number' from County.Contact join County.ContactNumber using (contactID)   join County.TelephoneInfo using (phone_number) group by contactID;


select contactID, firstname AS 'First Name', lastname AS 'Last Name', group_concat(County.TelephoneInfo.phone_number separator' | ') from County.Contact  join   ContactNumber using (contactID)   join County.TelephoneInfo using (phone_number) group by contactID;

select contactID, firstname AS 'First Name', lastname AS 
'Last Name', 
group_concat(County.TelephoneInfo.phone_number, " " ,County.TelephoneInfo.phonetype_description separator' | ') as "Phone" from County.Contact  join   ContactNumber using (contactID)   join County.TelephoneInfo using (phone_number) group by contactID;

CREATE TABLE Company(
   companyname varchar(20) NOT NULL,
   company_url varchar(30), 
   company_phone varchar(13), 
   address_line1 varchar(35), 
   address_line2 varchar(35), 
   city varchar(30), 
   state varchar(2), 
   zip_postalcode varchar(9),
   country_region varchar(20), 
   parent_companyname varchar(20),
   Primary Key (companyname),
   CONSTRAINT parent_company_fk FOREIGN KEY (parent_companyname) REFERENCES Company(companyname)
   );
   
 -- COMPANY(parent_companyname) mei COMPANY(companyname)

INSERT INTO County.Company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('Paychex', 'http://www.pachex.com', '(585)387-6200', '911 Panorama Trail South', 'Rochester', 'NY', '14625', 'Monroe');
INSERT INTO County.Company(companyname,company_url,company_phone,address_line1,address_line2,city,state,zip_postalcode,parent_companyname) VALUES ('Bentrac', 'http://www.bentrac.com', '(877)645-4342', 'Paychex Benefit Technologies, Inc.', '2385 Northside Drive', 'San Diego', 'CA', '92108', 'Paychex');
INSERT INTO County.Company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('RIT', 'http://www.rit.edu', '(585)475-2411', '1 Lomb Memorial Drive', 'Rochester', 'NY', '14623', 'Monroe');
INSERT INTO County.Company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('Genese County', 'http://fakecounty.ny.us', '(585)343-4099', '5 Main Street', 'Batavia', 'NY', '14020', 'Genesee');

SELECT c.companyname, c.city, c.state , c.parent_companyname as 'Parent Company', 
       concat(p.address_line1,", ",p.city,", ",p.state," ",p.zip_postalcode) as 'Parent Company Address'
		FROM Company c JOIN Company p
		ON c.parent_companyname = p.companyname;

DROP TABLE IF EXISTS Personal;
CREATE TABLE Personal(
contactID int(5) NOT NULL, 
street varchar(25), 
city varchar(20), 
state char(2), 
zip varchar(9), 
rel_or_friend varchar(6),
PRIMARY KEY (contactID),
CONSTRAINT Personal_contact_fk FOREIGN KEY (contactID) REFERENCES Contact(contactID)
);	

insert into Personal values ("10008","2 Main St.","Plymouth","MI","48120","rel");
INSERT INTO Personal(contactID, street, city, state, zip, rel_or_friend) VALUES ('10004', '8015 Lewiston', 'Pittsford', 'NY', '14534', 'friend');
INSERT INTO Personal(contactID, street, city, state, zip, rel_or_friend) VALUES ('10006', '3234 Arlington', 'columbus', 'OH', '43002', 'rel');
INSERT INTO `County`.`Personal` (`contactID`, `street`, `city`, `state`, `zip`, `rel_or_friend`) VALUES ('10007', '3243 Main', 'Pittsford', 'NY', '14534', 'friend');

select contactID, firstname, lastname, p.street, p.state, p.zip from Contact
    join Personal as p using (contactID);
    
    
DROP TABLE IF EXISTS Relative;
CREATE TABLE Relative(
contactID int(5) NOT NULL, 
relationship varchar(30),
PRIMARY KEY (contactID),
CONSTRAINT Relative_contact_fk FOREIGN KEY (contactID) REFERENCES Personal(contactID)
);    
   
insert into Relative values ("10008","Cousin");
INSERT INTO `County`.`Relative` (`contactID`, `relationship`) VALUES ('10006', 'Cousin');
  
    
    
DROP TABLE IF EXISTS Friend;   
CREATE TABLE Friend (
  contactID int(5) NOT NULL,
  known_from varchar(30) DEFAULT NULL,
  PRIMARY KEY (contactID),
  CONSTRAINT friend_Personal_fk FOREIGN KEY (contactID) REFERENCES Personal(contactID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;    

    





select contactID, firstname, lastname, p.street, p.state, p.zip, relationship from Contact
    join Personal as p using (contactID) join Relative using (contactID)
                   where p.rel_or_friend = "rel";
