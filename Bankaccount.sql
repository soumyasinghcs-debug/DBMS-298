create database if not exists banking_week;
show databases;
use banking_week;
create table Branch(branchname varchar(30),branchcity varchar(30), assests real, primary key(branchname)); 
desc Branch;
create table BankAccount(accno integer, branchname varchar(30), balance real , primary key(accno), foreign key (branchname) references Branch(branchname));
desc BankAccount;
create table Bankcustomer(customername varchar(30), customersstreet varchar(30), customercity varchar(30), primary key(customername));
desc BankCustomer;
create table Depositer (customername varchar(30), accno integer, primary key (customername, accno), foreign key(accno) references BankAccount(accno));
desc Depositer;
create table Loan (loannumber int, branchname varchar(30), amount real, primary key (loannumber), foreign key (branchname) references Branch(branchname));
insert into Branch values('SBI_Chamrajpet','Banglore', 50000);
insert into Branch values('SBI_ResidencyRoad','Bangloe',10000);
insert into Branch values('SBI_ShivajiRoad','Bombay',20000);
insert into Branch values('SBI_PaliamentRoad','Delhi',10000);
insert into Branch values('SBI_Jantarmantar','Delhi',20000);
select * from Branch;
insert into Loan values(2,'SBI_Chamrajpet','Banglore', 50000);
insert into Loan values(1,'SBI_ResidencyRoad','Bangloe',10000);
insert into Loan values(3,'SBI_ShivajiRoad','Bombay',20000);
insert into Loan values(4,'SBI_PaliamentRoad','Delhi',20000);
insert into Loan values(5,'SBI_Jantarmantar','Delhi',20000);
select * from Loan;
insert into BankAccount values(1,'SBI_Chamrajpet', 2000);
insert into BankAccount values(2,'SBI_ResidencyRoad',5000);
insert into BankAccount values(3,'SBI_ShivajiRoad',6000);
insert into BankAccount values(4,'SBI_PaliamentRoad',9000);
insert into BankAccount values(5,'SBI_Jantarmantar',8000);
insert into BankAccount values(6,'SBI_ShivajiRoad',4000);
insert into BankAccount values(7,'SBI_ResidencyRoad',4000);
insert into BankAccount values(8,'SBI_PaliamentRoad',3000);
insert into BankAccount values(9,'SBI_ResidencyRoad',5000);
insert into BankAccount values(10,'SBI_Jantarmantar',2000);
commit;
select * from BankAccount;

show databases;
create database banking_week3;
create table branch(branchname varchar(50) primary key, branchcity varchar(50), assests int);
CREATE TABLE bank_account (
    acc_no INT PRIMARY KEY,
    branchname VARCHAR(255),
    balance INT,
    FOREIGN KEY (branchname) REFERENCES branch(branchname)
);
create table bank_customer(customer_name varchar(50) primary key, customer_street varchar(50), customer_city varchar(50));
CREATE TABLE depositor (
    customer_name VARCHAR(50) PRIMARY KEY,
    acc_no INT,
    FOREIGN KEY (acc_no) REFERENCES bank_account(acc_no)
);
CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    branchname VARCHAR(255),
    balance INT,
    FOREIGN KEY (branchname) REFERENCES branch(branchname)
);

 show tables;
 
 insert into Branch values ("SBI_Chamrajpet","Banglore",50000);
 insert into Branch values ("SBI_ResidencyRoad","Banglore",10000);
 insert into Branch values ("SBI_ShivajiRoad","Bombay",20000);
 insert into Branch values ("SBI_ParlimentRoad","Delhi",10000);
 insert into Branch values ("SBI_Jantarmantar","Delhi",20000);
 
 insert into BankAccount values (1,"SBI_Chamrajpet", 2000);
 insert into BankAccount values (2,"SBI_ResidencyRoad", 5000);
 insert into BankAccount values (3,"SBI_ShivajiRoad", 6000);
 insert into BankAccount values (4,"SBI_ParlimentRoad", 9000);
 insert into BankAccount values (5,"SBI_Jantarmantar", 8000);
 insert into BankAccount values (6,"SBI_ShivajiRoad", 4000);
 insert into BankAccount values (7,"SBI_ResidencyRoad", 4000);
 insert into BankAccount values (8,"SBI_ParlimentRoad", 3000);
 insert into BankAccount values (9,"SBI_ResidencyRoad", 5000);
 insert into BankAccount values (10,"SBI_Jantarmantar", 2000);
 
 select * from branch;
 DELETE FROM branch WHERE branchname=1;

insert into Bankcustomer values ("Avinash","Bull_Temple_Road","Banglore");
insert into Bankcustomer values ("Dinesh","Bannergatta_Road","Banglore");
insert into Bankcustomer values ("Mohan","NationalCollege_Road","Banglore");
insert into Bankcustomer values ("Nikhil","Akbar_Road","Delhi");
insert into Bankcustomer values ("Ravi","Prithviraj_Road","Delhi");

insert into Loan values (1,"SBI_Chamrajpet", 1000);
insert into Loan values (2,"SBI_ResidencyRoad", 2000);
insert into Loan values (3,"SBI_ShivajiRoad", 3000);
insert into Loan values (4,"SBI_ParlimentRoad", 4000);
insert into Loan values (5,"SBI_Jantarmantar", 5000);

insert into Depositor values ("Avinash", 1);
insert into Depositor values ("Dinesh", 2);
insert into Depositor values ("Nikhil", 4);
insert into Depositor values ("Ravi", 5);
insert into Depositor values ("Avinash", 8);
insert into Depositor values ("Nikhil", 9);
insert into Depositor values ("Dinesh", 10);
insert into Depositor values ("Nikhil", 11);
