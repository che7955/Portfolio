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
co_worker tinyint UNSIGNED DEFAULT 0, /* discriminating attribute for co_worker subtype */
vendor tinyint UNSIGNED DEFAULT 0,    /* discriminating attribute for vendor subtype */
personal tinyint UNSIGNED DEFAULT 0,  /* discriminating attribute for personal subtype */
companyname varchar(20),
CONSTRAINT contact_pk PRIMARY KEY (contactID)
);



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

ALTER TABLE ContactNumber ADD FOREIGN KEY(contactID) REFERENCES Contact(contactID)
	ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ContactNumber ADD FOREIGN KEY(phone_number) REFERENCES TelephoneInfo(phone_number)
        ON DELETE CASCADE ON UPDATE CASCADE;

-- Insert data into countydb

INSERT INTO Contact VALUES
('10001','Mary','E','Smith','Mrs',null,'Clerk','Finance','Mary.Smith@county.ny.us','www.fakecounty.ny.us','Mary.Smith','1960-06-22',null,1,null,null,'Genesee County');
INSERT INTO Contact VALUES
('10002','Jim','T','Martin','Mr',null,'Director','Finance','Jim.Martin@county.ny.us','www.fakecounty.ny.us','Jim.Martin','1954-08-19',null,1,null,null,'Genesee County');
INSERT INTO county.contact (contactID, firstname, lastname, suffix_description, title_description, jobtitle, email, url, Birthday, co_worker, companyname) VALUES ('10003', 'Jim', 'Bucki', 'Mr.', 'Java Programmer', 'Programmer', 'JMBucki@xyzcounty.com', 'www.exzcounty.ny.us', '1962-04-28', '1','GCC');
INSERT INTO county.contact (contactID, firstname, middleinitial, lastname, suffix_description, title_description, jobtitle, department, email, url, birthday, co_worker, personal,companyname) VALUES ('10004', 'Elissa', '', 'Weeden', 'Mrs.', 'RIT Professor', 'DBMA', 'IST', 'eweeden@yahoo.com', 'http://www.ist.rit.edu/people/people.php', '1975-08-08', '1', '1','RIT');
INSERT INTO county.contact (contactID, firstname, middleinitial, lastname, suffix_description, title_description, department, email, url, birthday, co_worker, personal,companyname) VALUES ('10005', 'Jim', 'R', 'Habermas', 'Mr.', 'Lecturer', 'IST', 'jrhabermas@gmail.com', 'http://jimhabermas.com', '1962-04-28', 1, 1,'RIT');
INSERT INTO county.contact (contactID, firstname, lastname, suffix_description, title_description, jobtitle, email, birthday, personal, companyname) VALUES ('10006', 'Bill', 'Streetman', 'Mr.', 'Engineer', 'Engineer', 'bstreetman@yahoo.com', '1957-04-20', '1', 'GE');


INSERT INTO CONTACT values(10007,"Rita","E","Habermas","Ms",null,
null,null,"rita@aol.com",
  null,null,"1960-03-08",null,1,0,1,null);

INSERT INTO CONTACT values(10008,"Barb","S","Craft","Ms",null,
null,null,"barb@aol.com",
  null,null,"1960-04-07",null,0,0,1,null);

INSERT INTO CONTACT values(10009,"Dawn","P","Habermas","Ms",null,
null,null,"dewy@aol.com",
  null,null,"1963-10-07",null,0,0,1,null);



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

SELECT * FROM Contact;
SELECT * FROM TelephoneInfo;
SELECT * FROM ContactNumber;

SELECT firstname AS 'First Name', lastname AS 'Last Name', TelephoneInfo.phone_number AS 'Phone Number', phonetype_description AS 'Phone Type' FROM Contact,ContactNumber,TelephoneInfo where ContactNumber.phone_number=TelephoneInfo.phone_number and Contact.contactID=ContactNumber.contactID;

select contactID, firstname AS 'First Name', lastname AS 'Last Name', TelephoneInfo.phone_number AS 'Phone Number' from county.contact join county.ContactNumber using (contactID)   join county.telephoneinfo using (phone_number) group by contactID;


select contactID, firstname AS 'First Name', lastname AS 'Last Name', group_concat(county.telephoneinfo.phone_number separator' | ') from county.contact  join   ContactNumber using (contactID)   join county.telephoneinfo using (phone_number) group by contactID;

select contactID, firstname AS 'First Name', lastname AS 'Last Name', group_concat(county.telephoneinfo.phone_number, " " ,county.telephoneinfo.phonetype_description separator' | ') as "Phone" from county.contact  join   ContactNumber using (contactID)   join county.telephoneinfo using (phone_number) group by contactID;

DROP TABLE IF EXISTS COMPANY;
CREATE TABLE COMPANY(
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
   	ON DELETE SET NULL 
        /* DELETE of a companyname in COMPANY will set value in parent_company to 
        NULL- ok since a company doesn't have to have a parent company */ 
   );
   






INSERT INTO county.company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('Paychex', 'http://www.pachex.com', '(585)387-6200', '911 Panorama Trail South', 'Rochester', 'NY', '14625', 'Monroe');
INSERT INTO county.company(companyname,company_url,company_phone,address_line1,address_line2,city,state,zip_postalcode,parent_companyname) VALUES ('Bentrac', 'http://www.bentrac.com', '(877)645-4342', 'Paychex Benefit Technologies, Inc.', '2385 Northside Drive', 'San Diego', 'CA', '92108', 'Paychex');
INSERT INTO county.company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('RIT', 'http://www.rit.edu', '(585)475-2411', '1 Lomb Memorial Drive', 'Rochester', 'NY', '14623', 'Monroe');
INSERT INTO county.company(companyname,company_url,company_phone,address_line1,city,state,zip_postalcode,country_region) VALUES ('Genesee County', 'http://fakecounty.ny.us', '(585)343-4099', '5 Main Street', 'Batavia', 'NY', '14020', 'Genesee');
INSERT INTO `county`.`company` (`companyname`, `company_url`, `company_phone`, `address_line1`, `address_line2`, `city`, `state`, `zip_postalcode`, `country_region`) VALUES ('GCC', 'http://www.genesee.edu', '(585)343-0055', '1 College Rd', '', 'Batavia', 'NY', '14020', 'Genesee.edu');
INSERT INTO `county`.`company` (`companyname`, `company_url`) VALUES ('GE', 'http://www.ge.com');


ALTER TABLE Contact add constraint contact_company_fk FOREIGN KEY(companyname) REFERENCES company(companyname)
	ON DELETE SET NULL
		/* DELETE of a COMPANY will cause companyname in CONTACT to be set to NULL for contact of that company- this is ok, because a contact doesn't have to have a company */
	ON UPDATE CASCADE;
		/* A change in companyname in COMPANY will cascade to companyname in 			CONTACT */


SELECT c.companyname, c.city, c.state , c.parent_companyname as 'Parent Company', 
       concat(p.address_line1,", ",p.city,", ",p.state," ",p.zip_postalcode) as 'Parent Company Address'
		FROM company c JOIN company p
		ON c.parent_companyname = p.companyname;

DROP TABLE IF EXISTS PERSONAL;
CREATE TABLE PERSONAL(
contactID int(5) NOT NULL, 
street varchar(25), 
city varchar(20), 
state char(2), 
zip varchar(9), 
rel_or_friend ENUM('rel', 'friend'),
PRIMARY KEY (contactID),
CONSTRAINT personal_contact_fk FOREIGN KEY (contactID) REFERENCES contact(contactID)
	ON DELETE CASCADE	
		/* DELETE of a CONTACT, that is also a PERSONAL contact, will cause the 		PERSONAL record to also be deleted */
	ON UPDATE CASCADE
		/* UPDATE of a CONTACT's contactID, will cascade if that CONTACT is a 			PERSONAL contact */ 

);	

INSERT INTO personal(contactID, street, city, state, zip, rel_or_friend) VALUES ('10004', '8015 Lewiston', 'Pittsford', 'NY', '14534', 'friend');
INSERT INTO personal(contactID, street, city, state, zip, rel_or_friend) VALUES ('10006', '3234 Arlington', 'columbus', 'OH', '43002', 'rel');

INSERT into personal VALUES ("10007","8015 Lewiston Rd","Brockport","NY","14024","rel");

INSERT INTO personal VALUES ("10008","32847 Arlington","Canton","MI","48170","friend");

INSERT into personal VALUES ("10009","3243 South Ave","Rochester","NY","14623","rel");


select contactID, firstname, lastname, p.street, p.state, p.zip from contact
    join personal as p using (contactID);
    

    

DROP TABLE IF EXISTS relative;
CREATE TABLE relative(
contactID int(5) NOT NULL, 
relationship varchar(15),
PRIMARY KEY (contactID),
CONSTRAINT relative_personal_fk FOREIGN KEY (contactID) REFERENCES personal(contactID)
	ON DELETE CASCADE
		/* DELETE of a PERSONAL contact, that is also a RELATIVE, will cause the RELATIVE record to also be deleted */
	ON UPDATE CASCADE 
		/* UPDATE of a PERSONAL contact's contactID, will cascade if that PERSONAL contact is a RELATIVE */ 

);
-- RELATIVE(contactID) mei PERSONAL(contactID)
INSERT INTO relative(contactID,relationship) VALUES ('10006', 'cousin');

INSERT INTO relative(contactID,relationship) VALUES ('10007', 'X-Wife');

INSERT INTO  relative VALUES ("10009","Wife");


DROP TABLE IF EXISTS friend;
CREATE TABLE friend(
contactID int(5) NOT NULL, 
known_from varchar(20),
PRIMARY KEY (contactID),
CONSTRAINT friend_personal_fk FOREIGN KEY (contactID) REFERENCES personal(contactID)
	ON DELETE CASCADE
		/* DELETE of a PERSONAL contact, that is also a FRIEND, will cause the 		FRIEND record to also be deleted */
	ON UPDATE CASCADE 
		/* UPDATE of a PERSONAL contact's contactID, will cascade if that PERSONAL 		contact is a FRIEND */ 

);

INSERT INTO friend VALUES ('10004', 'work'); 
INSERT INTO friend values ('10008','HomeTown');


  

DROP TABLE IF EXISTS co_worker;
CREATE TABLE co_worker(
contactID int(5) NOT NULL,  /* fk */
office_number varchar(20),
CONSTRAINT co_worker_pk PRIMARY KEY (contactID),
CONSTRAINT co_worker_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID)
	ON DELETE CASCADE
		/* DELETE of a CONTACT, that is also a CO_WORKER, will cause the CO_WORKER record to also be deleted */

	ON UPDATE CASCADE
		/* UPDATE of a CONTACT's contactID, will cascade if that CONTACT is a CO_WORKER */ 

);



  
-- Create the VENDOR table from the VENDOR relation

/* VENDOR(contactID, co_worker_referrer_contactID)
	VENDOR(contactID) mei CONTACT(contactID)
	VENDOR(co_worker_referrer_contactID) mei CO_WORKER(contactID)
	PK = contactID */

CREATE TABLE vendor(
contactID int(5) NOT NULL,  /* fk */
co_worker_referrer_contactID int(5) NOT NULL, /* fk */
CONSTRAINT vendor_pk PRIMARY KEY (contactID),
CONSTRAINT vendor_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
CONSTRAINT vendor_co_worker_referrer_contactID_fk FOREIGN KEY (co_worker_referrer_contactID) REFERENCES co_worker(contactID)
ON UPDATE CASCADE
);

DESCRIBE vendor;  

select contactID, firstname, lastname, p.street, p.state, p.zip from contact
    join personal as p using (contactID);


select contactID, firstname, lastname, p.street, p.state, p.zip, friend.known_from from contact
    join personal as p using (contactID) join friend using (contactID)
           where p.rel_or_friend = "friend";


select contactID, firstname, lastname, p.street, p.state, p.zip, relationship from contact
    join personal as p using (contactID) join relative using (contactID)
                   where p.rel_or_friend = "rel";