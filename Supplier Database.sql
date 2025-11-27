create database if not exists supplier_database;
show databases;
use supplier_database;
create table SUPPLIERS(sid integer(5) primary key, sname varchar(20), city varchar(20));
desc SUPPLIERS;
create table PARTS(pid integer(5) primary key, pname varchar(20), color varchar(10));
desc PARTS;
create table CATALOG(sid int(5), pid int(5), foreign key(sid) references SUPPLIERS(sid), foreign key(pid) references PARTS(pid), cost float(6), primary key(sid,pid));
desc CATALOG;
insert into suppliers values(10001, ' Acme Widget','Bangalore');
insert into suppliers values(10002, ' Johns','Kolkata');
insert into suppliers values(10003, ' Vimal','Mumbai');
insert into suppliers values(10004, ' Reliance','Delhi');
insert into suppliers values(10005, ' Mahindra','Mumbai');
select*from SUPPLIERS;

insert into PARTS values(20001, 'Book','Red');
insert into PARTS values(20002, 'Pen','Red');
insert into PARTS values(20003, 'Pencil','Green');
insert into PARTS values(20004, 'Mobile','Green');
insert into PARTS values(20005, 'Charger','Black');
select* from PARTS;

insert into CATALOG values(10001, 20001,10);
insert into CATALOG values(10001, 20002,10);
insert into CATALOG values(10001, 20003,30);
insert into CATALOG values(10001, 20004,10);
insert into CATALOG values(10001, 20005,10);

insert into CATALOG values(10002, 20001,10);
insert into CATALOG values(10002, 20002,20);
insert into CATALOG values(10003, 20003,30);
insert into CATALOG values(10004, 20003,40);
select * from CATALOG;

SELECT DISTINCT P.pname FROM Parts P, Catalog C WHERE P.pid = C.pid;

SELECT S.sname FROM Suppliers S WHERE (( SELECT count(P.pid) FROM Parts P ) = ( SELECT count(C.pid) FROM Catalog C WHERE C.sid = S.sid ));

SELECT S.sname
FROM Suppliers S
WHERE
(( SELECT count(P.pid)
FROM Parts P where color='Red' ) =
( SELECT count(C.pid)
FROM Catalog C, Parts P
WHERE C.sid = S.sid AND
C.pid = P.pid AND P.color = 'Red' ));

SELECT P.pname
FROM Parts P, Catalog C, Suppliers S
WHERE P.pid = C.pid AND C.sid = S.sid
AND S.sname = ' Acme Widget'
AND NOT EXISTS ( SELECT *
FROM Catalog C1, Suppliers S1 WHERE P.pid = C1.pid AND C1.sid = S1.sid AND
S1.sname <> ' Acme Widget');

SELECT DISTINCT C.sid FROM Catalog C WHERE C.cost > ( SELECT AVG (C1.cost) FROM Catalog C1 WHERE C1.pid = C.pid );

SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX (C1.cost)
		FROM Catalog C1
		WHERE C1.pid = P.pid);
        
        
          # week 8
          
          
#1
        
SELECT P.pid, P.pname, S.sname, C.cost
FROM PARTS P, SUPPLIERS S, CATALOG C
WHERE P.pid = C.pid
AND S.sid = C.sid
AND C.cost = (SELECT MAX(cost) FROM CATALOG);



#2

Select S.sname FROM SUPPLIERS S WHERE S.sid NOT IN ( SELECT C.sid FROM CATALOG C, PARTS P WHERE C.pid = P.pid AND P.color = 'Red');


#3

SELECT S.sname, SUM(C.cost) AS total_value
FROM SUPPLIERS S, CATALOG C
WHERE S.sid = C.sid
GROUP BY S.sname;


#4

SELECT S.sname
FROM SUPPLIERS S, CATALOG C
WHERE S.sid = C.sid
AND C.cost < 20
GROUP BY S.sname
HAVING COUNT(*) >= 2;

#5

SELECT P.pname, S.sname, C.cost
FROM PARTS P, SUPPLIERS S, CATALOG C
WHERE P.pid = C.pid
AND S.sid = C.sid
AND C.cost = (
    SELECT MIN(C1.cost)
    FROM CATALOG C1
    WHERE C1.pid = P.pid);

#6

CREATE VIEW Supplier_Part_Count AS
SELECT S.sid, S.sname, COUNT(C.pid) AS total_parts
FROM SUPPLIERS S, CATALOG C
WHERE S.sid = C.sid
GROUP BY S.sid, S.sname;

select * from Supplier_Part_Count;

#7

CREATE VIEW MostExpSupplier AS
SELECT P.pid, P.pname, S.sname, C.cost
FROM PARTS P, SUPPLIERS S, CATALOG C
WHERE P.pid = C.pid
AND S.sid = C.sid
AND C.cost = (
    SELECT MAX(C1.cost)
    FROM CATALOG C1
    WHERE C1.pid = P.pid
);

select * from MostExpSupplier;

DELIMITER $$

CREATE TRIGGER prevent_low_cost
BEFORE INSERT ON CATALOG
FOR EACH ROW
BEGIN
    IF NEW.cost < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cost cannot be below 1';
    END IF;
END $$

DELIMITER ;    

#9

DELIMITER $$

CREATE TRIGGER set_default_cost
BEFORE INSERT ON CATALOG
FOR EACH ROW
BEGIN
    IF NEW.cost IS NULL THEN
        SET NEW.cost = 10;
    END IF;
END $$

DELIMITER ;



