-- Week 15 Example     

DROP DATABASE IF EXISTS users;
CREATE DATABASE users;

USE users;
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts(
  acctid smallInt unsigned not null auto_increment primary key,
  name   varChar(30) not null,
  pswd   char(41) not null
  );
  
  
  INSERT INTO accounts (name, pswd)
  		VALUES("Sam", password("secret"));
  INSERT INTO accounts (name, pswd)
  		VALUES("Jim", password("LetsGoBills")); 		
  INSERT INTO accounts (name, pswd)
                VALUES("John",SHA("LetsGoBills"));
  
  SELECT * FROM accounts;
  			
  SELECT * FROM accounts WHERE pswd = password("secret");
  


  
  
  