use Bigdatasql;

/*Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.
*/
SELECT * FROM city WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
SELECT * FROM city;

/*Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
The CountryCode for America is USA.*/
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = "USA";
/*Q3. Query all columns (attributes) for every row in the CITY table.*/
 select * from CITY;
 /*Q4. Query all columns for a city in CITY with the ID 1661.
*/
 SELECT * FROM City WHERE ID = 1661;
/*Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is
JPN.
*/
SELECT *
FROM City
WHERE CountryCode = 'JPN';
/*Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is
JPN.
*/
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN'

/*
Q7. Query a list of CITY and STATE from the STATION table.
*/
SELECT CITY,STATE FROM STATION; 
/* Q8. Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer. */
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID,2)=0 ORDER BY CITY ASC;  
/*9. Find the difference between the total number of CITY entries in the table and the number of
distinct CITY entries in the table*/
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;  
   
 /* Q10 Query the two cities in STATION with the shortest and longest CITY names, as well as their
respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
largest city, choose the one that comes first when ordered alphabetically.
*/
( SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY), CITY
    LIMIT 1
)

UNION

(
    SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY
    LIMIT 1
)  
/*Q11. the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result
cannot contain duplicates.
*/
   
   SELECT DISTINCT(CITY) FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' 
OR CITY LIKE 'U%' ORDER BY CITY ASC;   

/*Q12. the list of CITY names ENDING with vowels (i.e., a, e, i, o, or u) from STATION. Your result
cannot contain duplicates.
*/
   SELECT DISTINCT(CITY) FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' 
OR CITY LIKE '%u';    

/*Q13.Query the list of CITY names from STATION that do not start with vowels. Your result cannot
contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE upper(SUBSTR(CITY,1,1)) NOT IN ('A','E','I','O','U') AND lower(SUBSTR(CITY,1,1)) NOT IN
('a','e','i','o','u');    
/*Query the list of CITY names from STATION that do not end with vowels. Your result cannot
contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE UPPER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('A','E','I','O','U') AND LOWER(SUBSTR(CITY, LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');  
/*Query the list of CITY names from STATION that either do not start with vowels or do not end
with vowels. Your result cannot contain duplicates.  */
SELECT DISTINCT CITY FROM STATION WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN ('a','e','i','o','u') AND LOWER(SUBSTR(CITY,LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');    
/*Q16. Query the list of CITY names from STATION that do not start with vowels and do not end with
vowels. Your result cannot contain duplicates.*/

/*Q17.Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
between 2019-01-01 and 2019-03-31 inclusive.*/

INSERT INTO product
VALUES(1, 'S8', 1000),
	(2, 'G4' ,800),
    (3, 'iPhone' ,1400);

SELECT * FROM product;
INSERT INTO sales
VALUES(1, 1,1,'2019-01-21', 2, 2000),
	(1, 2, 2, '2019-02-17', 1 ,800),
    (2, 2 ,3, '2019-06-02' ,1, 800),
    (3, 3, 4, '2019-05-13' ,2, 2800)
    ;
    select * from sales;
    
SELECT product_id, 
       product_name 
FROM   product 
WHERE  product_id NOT IN (SELECT product_id 
                          FROM   sales 
                          WHERE  sale_date NOT BETWEEN 
                                 '2019-01-01' AND '2019-03-31'); 

/*Q18.Write an SQL query to find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order.*/
create table Views
(
article_id int,
author_id int,
viewer_id int,
view_date date
);

INSERT INTO Views 
values(1, 3, 5, '2019-08-01'),
(1, 3, 6 ,'2019-08-02'),
(2 ,7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');
select * from Views;

select distinct author_id as id
from Views
where author_id = viewer_id
order by author_id asc
/*19 Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
places.*/




/* Q20Write an SQL query to find the team size of each of the employees.
Return result table in any order*/
create table  Employee
(
employee_id int not null,
team_id int,
    PRIMARY KEY (employee_id)
    );
    
    insert into Employee values(1 ,8),
(2, 8),
(4 ,7),
(5, 9),
(6, 9);
select * from employee;



/* Q21 Write an SQL query to find the type of weather in each country for November 2019.
The type of weather is:
● Cold if the average weather_state is less than or equal 15,
● Hot if the average weather_state is greater than or equal to 25, and
● Warm otherwise.
Return result table in any order*/
 create table Countries
 (
 country_id int not null,
country_name varchar (50),
primary key(country_id)
);

 create table Weather
 (
 country_id int not null,
weather_state int,
day date not null,
primary key(country_id,day)
);

insert into Countries values(2, 'USA'),
(3, 'Australia'),
(7, 'Peru'),
(5,'china'        
),
(8,'moroco'),
(9,'spain');


insert into Weather values(2,15,'2019-11-01'),
(1, 2 ,'2019-10-27'),
(1,2, '2019-11-10'),
(3 ,0, '2019-11-11'),
(3, 3,'2019-11-12'),
(5, 16, '2019-11-07'),
(5, 18, '2019-11-09'),
(5, 21, '2019-11-23'),
(7, 25, '2019-11-28'),
(7, 22, '2019-12-01'),
(7, 20, '2019-12-02'),
(8, 25, '2019-11-05'),
(8, 27, '2019-11-15'),
(8, 31, '2019-11-25'),
(9, 7 ,'2019-10-23'),
(9, 3, '2019-12-23'),
(2,12,'2019-10-28');


select country_name, case when avg(weather_state) <= 15 then "Cold"
                          when avg(weather_state) >= 25 then "Hot"
                          else "Warm" end as weather_type
from Countries inner join Weather
on Countries.country_id = Weather.country_id
where left(day, 7) = '2019-11'
group by country_name

/*Q23.Write an SQL query to find the average selling price for each product. average_price should be
rounded to 2 decimal places.
*/
 
 
 /*Q24. Write an SQL query to report the first login date for each player.
Return the result table in any ordeer.*/
create table  Activity
(
player_id int not null, 
device_id int,
event_date date not null,
games_played int,
primary key(player_id,event_date)
);
insert into Activity values(1, 2, '2016-03-01', 5),
(1, 2 ,'2016-05-02' ,6),
(3, 1 ,'2016-03-02', 0),
(3, 4, '2018-07-03' ,5),
(2, 3, '2017-06-25' ,1);


SELECT
	player_id,
	device_id
FROM (
	 SELECT 
	 	player_id,
	 	device_id,
	 	event_date,
	 	MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) as first_login
	 FROM Activity
 	) t1
 WHERE event_date = first_login
 
 
 /*Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
and their amount.
Return result table in any order*/
 create table Products(
 product_id int not null ,
product_name varchar(50),
product_category varchar(50),
primary key( product_id)
);
create table order(
product_id int not null,
order_date date,
unit int
FOREIGN KEY ( product_id) REFERENCES Products( product_id)
);









select p.product_name as product_name, o.sum_unit as unit from Products p 
join 

(select product_id, sum(unit) as sum_unit from Orders where order_date >= '2020-02-01' and order_date < '2020-03-01' 
group by product_id) o 

on p.product_id = o.product_id
where o.sum_unit >= 100

/* Q27 Write an SQL query to find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:
● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
'_', period '.', and/or dash '-'. The prefix name must start with a letter.
● The domain is '@leetcode.com'.
Return the result table in any order*/










/* 28 Write an SQL query to report the customer_id and customer_name of customers who have spent at
least $100 in each month of June and July 2020.
Return the result table in any order.*/

create table Customers(
customer_id int not null,
name varchar(50),
country varchar(50),
primary key (customer_id)
);
create table product1(
product_id  int not null,
name varchar(50),
country varchar(50),
primary key (product_id)
);

insert into customers values(1, 'Winston' ,'USA'),
(2, 'Jonathan', 'Peru'),
(3, 'Moustafa', 'Egypt');
insert into product1 values(10,' LC Phone', 300),
(20, 'LC T-Shirt' ,10),
(30, 'LC Book', 45),(40, 'LC Keychain', 2);


create table  Orderss
(
order_id int not null,
customer_id int,
product_id int,
order_date date,
quantity int
);

insert into orderss values
(1, 1,10, '2020-06-10' ,1),
(2 ,1, 20, '2020-07-01', 1),
(3, 1, 30, '2020-07-08', 2),
(4, 2, 10, '2020-06-15', 2),
(5, 2, 40, '2020-07-01', 10),
(6, 3, 20, '2020-06-24', 2),
(7, 3, 30, '2020-06-25', 2),
(9, 3, 30, '2020-05-08', 3);


select o.customer_id, c.name
from Customers c, product1 p, Orderss o
where c.customer_id = o.customer_id and p.product_id = o.product_id
group by o.customer_id
having 
(
    sum(case when o.order_date like '2020-06%' then o.quantity*p.price else 0 end) >= 100
    and
    sum(case when o.order_date like '2020-07%' then o.quantity*p.price else 0 end) >= 100
)

/* 30 Write an SQL query to find the npv of each query of the Queries table.
Return the result table in any order.
*/
create table npv
(
  id INT,
  year INT,
  npv INT,
  CONSTRAINT pk_npv PRIMARY KEY(id, year)
);
CREATE TABLE queries
(
  id INT,
  year INT,
  CONSTRAINT pk_quereis PRIMARY KEY(id,year)
);

INSERT INTO npv VALUES(1, 2018, 100);
INSERT INTO npv VALUES(7, 2020, 30);
INSERT INTO npv VALUES(13, 2019, 40);
INSERT INTO npv VALUES(1, 2019, 113);
INSERT INTO npv VALUES(2, 2008, 121);
INSERT INTO npv VALUES(3, 2009, 12);
INSERT INTO npv VALUES(11, 2020, 99);
INSERT INTO npv VALUES(7, 2019, 0);

INSERT INTO queries VALUES(1, 2019);
INSERT INTO queries VALUES(2, 2008);
INSERT INTO queries VALUES(3, 2009);
INSERT INTO queries VALUES(7, 2018);
INSERT INTO queries VALUES(7, 2019);
INSERT INTO queries VALUES(7, 2020);
INSERT INTO queries VALUES(13, 2019);
select * from npv;
select * from queries;
SELECT 
  q.id,
  q.year, 
  ifnull(n.npv,0) as npv
FROM 
  queries AS q
  LEFT JOIN npv AS n ON q.id = n.id AND q.year = n.year
;
DROP TABLE queries;
DROP TABLE npv;
/*Write an SQL query to find the npv of each query of the Queries table.
Return the result table in any order.*/
CREATE TABLE npv
(
  id INT,
  year INT,
  npv INT,
  CONSTRAINT pk_npv PRIMARY KEY(id, year)
);

CREATE TABLE queries
(
  id INT,
  year INT,
  CONSTRAINT pk_quereis PRIMARY KEY(id,year)
);

INSERT INTO npv VALUES(1, 2018, 100);
INSERT INTO npv VALUES(7, 2020, 30);
INSERT INTO npv VALUES(13, 2019, 40);
INSERT INTO npv VALUES(1, 2019, 113);
INSERT INTO npv VALUES(2, 2008, 121);
INSERT INTO npv VALUES(3, 2009, 12);
INSERT INTO npv VALUES(11, 2020, 99);
INSERT INTO npv VALUES(7, 2019, 0);

INSERT INTO queries VALUES(1, 2019);
INSERT INTO queries VALUES(2, 2008);
INSERT INTO queries VALUES(3, 2009);
INSERT INTO queries VALUES(7, 2018);
INSERT INTO queries VALUES(7, 2019);
INSERT INTO queries VALUES(7, 2020);
INSERT INTO queries VALUES(13, 2019);
SELECT 
  q.id,
  q.year, 
  ifnull(n.npv,0) as npv
FROM 
  queries AS q
  LEFT JOIN npv AS n ON q.id = n.id AND q.year = n.year
  
  /* 32 Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
show null.
Return the result table in any order.*/
CREATE TABLE employees
(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_employees PRIMARY KEY(id)
);

CREATE TABLE employee_uni
(
  id INT,
  unique_id INT,
  CONSTRAINT pk_employee_uni PRIMARY KEY(id, unique_id)
);

INSERT INTO employees VALUES(1, 'Alice');
INSERT INTO employees VALUES(7, 'Bob');
INSERT INTO employees VALUES(11, 'Meir');
INSERT INTO employees VALUES(90, 'Winston');
INSERT INTO employees VALUES(3, 'Jonathan');

INSERT INTO employee_uni VALUES(3, 1);
INSERT INTO employee_uni VALUES(11, 2);
INSERT INTO employee_uni VALUES(90, 3);

SELECT
  eu.unique_id,
  e.name
FROM
  employees e
  LEFT JOIN employee_uni eu ON e.id = eu.id
  
  DROP TABLE employee_uni;
DROP TABLE employees;

--Q33:

CREATE TABLE users
(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_users PRIMARY KEY(id)
);

CREATE TABLE rides
(
  id INT,
  user_id INT,
  distance INT,
  CONSTRAINT pk_rides PRIMARY KEY(id)
);



INSERT INTO users VALUES(1, 'Alice');
INSERT INTO users VALUES(2, 'Bob');
INSERT INTO users VALUES(3, 'Alex');
INSERT INTO users VALUES(4, 'Donald');
INSERT INTO users VALUES(7, 'Lee');
INSERT INTO users VALUES(13, 'Jonathan'); 
INSERT INTO users VALUES(19, 'Elvis');

INSERT INTO rides VALUES(1, 1, 120);
INSERT INTO rides VALUES(2, 2, 317);
INSERT INTO rides VALUES(3, 3, 222);
INSERT INTO rides VALUES(4, 7, 100);
INSERT INTO rides VALUES(5, 13, 312);
INSERT INTO rides VALUES(6, 19, 50);
INSERT INTO rides VALUES(7, 7, 120);
INSERT INTO rides VALUES(8, 19, 400);
INSERT INTO rides VALUES(9, 7, 230);

SELECT
  u.name,
  SUM(CASE
    WHEN r.distance IS NULL
      THEN 0
    ELSE
      r.distance
  END) AS travelled_distance
FROM
  users u
  LEFT JOIN rides r ON u.id = r.user_id
GROUP BY
  u.id,
  u.name
ORDER BY
  travelled_distance DESC,
  u.name
;

--drop tables

DROP TABLE users;
DROP TABLE rides;

--Q34:

CREATE TABLE products
(
  product_id INT,
  product_name VARCHAR(30),
  product_category VARCHAR(30),
  CONSTRAINT pk_products PRIMARY KEY(product_id)
);

CREATE TABLE orders
(
  product_id INT,
  order_date DATE,
  unit INT,
  CONSTRAINT fk_product FOREIGN KEY (product_id)
    REFERENCES products(product_id) 
);

INSERT INTO products VALUES(1, 'Leetcode Solutions', 'Book');
INSERT INTO products VALUES(2, 'Jewels of Stringology', 'Book');
INSERT INTO products VALUES(3, 'HP', 'Laptop');
INSERT INTO products VALUES(4, 'Lenovo', 'Laptop');
INSERT INTO products VALUES(5, 'Leetcode Kit', 'T-shirt');

INSERT INTO orders VALUES(1, '2020-02-05', 60);
INSERT INTO orders VALUES(1, '2020-02-10', 70);
INSERT INTO orders VALUES(2, '2020-01-18', 30);
INSERT INTO orders VALUES(2, '2020-02-11' ,80);
INSERT INTO orders VALUES(3, '2020-02-17', 2);
INSERT INTO orders VALUES(3, '2020-02-24', 3);
INSERT INTO orders VALUES(4, '2020-03-01', 20);
INSERT INTO orders VALUES(4, '2020-03-04', 30);
INSERT INTO orders VALUES(4, '2020-03-04', 60);
INSERT INTO orders VALUES(5, '2020-02-25', 50);
INSERT INTO orders VALUES(5, '2020-02-27', 50);
INSERT INTO orders VALUES(5, '2020-03-01', 50);

SELECT
  p.product_name,
  SUM(unit) AS unit
FROM
  products p
  JOIN orders o ON p.product_id = o.product_id
WHERE
  DATE_FORMAT(o.order_date, '%Y-%m') = '2020-02'
GROUP BY 
  p.product_id,
  p.product_name
HAVING
  SUM(unit) >= 100
;

--drop tables

DROP TABLE orders;
DROP TABLE products;


--Q35:

CREATE TABLE movies
(
  movie_id INT,
  title VARCHAR(25),
  CONSTRAINT pk_movies PRIMARY KEY(movie_id)
);

CREATE TABLE users
(
  user_id INT,
  name VARCHAR(25),
  CONSTRAINT pk_users PRIMARY KEY(user_id)
);

CREATE TABLE movie_rating
(
  movie_id INT,
  user_id INT,
  rating INT,
  created_at DATE,
  CONSTRAINT pk_movie_rating PRIMARY KEY(movie_id, user_id)
);

INSERT INTO movies VALUES(1, 'Avengers');
INSERT INTO movies VALUES(2, 'Frozen 2');
INSERT INTO movies VALUES(3, 'Joker');

INSERT INTO users VALUES(1, 'Daniel');
INSERT INTO users VALUES(2, 'Monica');
INSERT INTO users VALUES(3, 'Maria');
INSERT INTO users VALUES(4, 'James');

INSERT INTO movie_rating VALUES(1, 1, 3, '2020-01-12');
INSERT INTO movie_rating VALUES(1, 2, 4, '2020-02-11');
INSERT INTO movie_rating VALUES(1, 3, 2, '2020-02-12');
INSERT INTO movie_rating VALUES(1, 4, 1, '2020-01-01');
INSERT INTO movie_rating VALUES(2, 1, 5, '2020-02-17');
INSERT INTO movie_rating VALUES(2, 2, 2, '2020-02-01');
INSERT INTO movie_rating VALUES(2, 3, 2, '2020-03-01');
INSERT INTO movie_rating VALUES(3, 1, 3, '2020-02-22');
INSERT INTO movie_rating VALUES(3, 2, 4, '2020-02-25');

(
  SELECT
    u.name AS result
  FROM
    movie_rating mr 
    JOIN users u on mr.user_id = u.user_id
  GROUP BY
    u.user_id,
    u.name
  ORDER BY 
    COUNT(*) DESC,
    u.name ASC
  LIMIT 1
)
UNION 
(
  SELECT
    m.title AS result
  FROM
    movie_rating mr 
    JOIN movies m on mr.movie_id = m.movie_id
  WHERE
    DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
  GROUP BY
    m.movie_id,
    m.title
  ORDER BY 
    AVG(rating) DESC,
    m.title ASC
  LIMIT 1
) 
;

--drop tables

DROP TABLE users;
DROP TABLE movies;
DROP TABLE movie_rating;


--Q36:

CREATE TABLE users
(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_users PRIMARY KEY(id)
);

CREATE TABLE rides
(
  id INT,
  user_id INT,
  distance INT,
  CONSTRAINT pk_rides PRIMARY KEY(id)
);



INSERT INTO users VALUES(1, 'Alice');
INSERT INTO users VALUES(2, 'Bob');
INSERT INTO users VALUES(3, 'Alex');
INSERT INTO users VALUES(4, 'Donald');
INSERT INTO users VALUES(7, 'Lee');
INSERT INTO users VALUES(13, 'Jonathan'); 
INSERT INTO users VALUES(19, 'Elvis');

INSERT INTO rides VALUES(1, 1, 120);
INSERT INTO rides VALUES(2, 2, 317);
INSERT INTO rides VALUES(3, 3, 222);
INSERT INTO rides VALUES(4, 7, 100);
INSERT INTO rides VALUES(5, 13, 312);
INSERT INTO rides VALUES(6, 19, 50);
INSERT INTO rides VALUES(7, 7, 120);
INSERT INTO rides VALUES(8, 19, 400);
INSERT INTO rides VALUES(9, 7, 230);

SELECT
  u.name,
  SUM(CASE
    WHEN r.distance IS NULL
      THEN 0
    ELSE
      r.distance
  END) AS travelled_distance
FROM
  users u
  LEFT JOIN rides r ON u.id = r.user_id
GROUP BY
  u.id,
  u.name
ORDER BY
  travelled_distance DESC,
  u.name
;

--drop tables

DROP TABLE users;
DROP TABLE rides;


--Q37:

CREATE TABLE employees
(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_employees PRIMARY KEY(id)
);

CREATE TABLE employee_uni
(
  id INT,
  unique_id INT,
  CONSTRAINT pk_employee_uni PRIMARY KEY(id, unique_id)
);


INSERT INTO employees VALUES(1, 'Alice');
INSERT INTO employees VALUES(7, 'Bob');
INSERT INTO employees VALUES(11, 'Meir');
INSERT INTO employees VALUES(90, 'Winston');
INSERT INTO employees VALUES(3, 'Jonathan');

INSERT INTO employee_uni VALUES(3, 1);
INSERT INTO employee_uni VALUES(11, 2);
INSERT INTO employee_uni VALUES(90, 3);

SELECT
  eu.unique_id,
  e.name
FROM
  employees e
  LEFT JOIN employee_uni eu ON e.id = eu.id
;

--drop tables

DROP TABLE employee_uni;
DROP TABLE employees;


--Q38:

CREATE TABLE departments
(
  id INT,
  name VARCHAR(30),
  CONSTRAINT pk_department PRIMARY KEY(id)
);

CREATE TABLE students
(
  id INT,
  name VARCHAR(30),
  department_id INT,
  CONSTRAINT pk_students PRIMARY KEY(id)
);


INSERT INTO departments VALUES(1, 'Electrical Engineering');
INSERT INTO departments VALUES(7, 'Computer Engineering');
INSERT INTO departments VALUES(13, 'Business Administration');

INSERT INTO students VALUES(23, 'Alice', 1);
INSERT INTO students VALUES(1, 'Bob', 7);
INSERT INTO students VALUES(5, 'Jennifer', 13);
INSERT INTO students VALUES(2, 'John', 14);
INSERT INTO students VALUES(4, 'Jasmine', 77);
INSERT INTO students VALUES(3, 'Steve', 74);
INSERT INTO students VALUES(6, 'Luis', 1);
INSERT INTO students VALUES(8, 'Jonathan', 7);
INSERT INTO students VALUES(7, 'Daiana', 33);
INSERT INTO students VALUES(11, 'Madelynn', 1);

SELECT
  s.id,
  s.name
FROM
  students s
  LEFT JOIN departments d ON s.department_id = d.id
WHERE
  d.id IS NULL;

--drop tables

DROP TABLE students;
DROP TABLE departments;


--Q39:

CREATE TABLE calls
(
  from_id INT,
  to_id INT,
  duration INT
);

INSERT INTO calls VALUES(1, 2, 59);
INSERT INTO calls VALUES(2, 1, 11);
INSERT INTO calls VALUES(1, 3, 20);
INSERT INTO calls VALUES(3, 4, 100);
INSERT INTO calls VALUES(3, 4, 200);
INSERT INTO calls VALUES(3, 4, 200);
INSERT INTO calls VALUES(4, 3, 499);

SELECT 
  CASE 
    WHEN from_id < to_id 
      THEN from_id 
      ELSE 
        to_id 
  END AS person1, 
  CASE 
    WHEN from_id < to_id 
      THEN to_id 
    ELSE 
      from_id
  END AS  person2, 
  COUNT(*) AS call_count,
  SUM(duration) AS duration
FROM calls 
GROUP BY 
  CASE 
    WHEN from_id < to_id 
      THEN from_id 
      ELSE 
        to_id 
  END, 
  CASE 
    WHEN from_id < to_id 
      THEN to_id 
    ELSE 
      from_id
  END
;

--drop tables

DROP TABLE calls;


 --Q40:

 CREATE TABLE prices
(
  product_id INT,
  start_date DATE,
  end_date DATE,
  price INT,
  CONSTRAINT pk_prices PRIMARY KEY(product_id, start_date, end_date)
);

CREATE TABLE units_sold
(
  product_id INT,
  purchase_date DATE,
  units INT
);

INSERT INTO prices VALUES(1, '2019-02-17', '2019-02-28', 5);
INSERT INTO prices VALUES(1, '2019-03-01', '2019-03-22', 20);
INSERT INTO prices VALUES(2, '2019-02-01', '2019-02-20', 15);
INSERT INTO prices VALUES(2, '2019-02-21', '2019-03-31', 30);

INSERT INTO units_sold VALUES(1, '2019-02-25', 100);
INSERT INTO units_sold VALUES(1, '2019-03-01', 15);
INSERT INTO units_sold VALUES(2, '2019-02-10', 200);
INSERT INTO units_sold VALUES(2, '2019-03-22', 30);

SELECT
  p.product_id,
  ROUND(SUM(up.units*p.price)/SUM(up.units), 2) AS average_price
FROM
  units_sold up
  JOIN prices p ON up.product_id = p.product_id
    AND up.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
  p.product_id
;

--drop tables

DROP TABLE prices;
DROP TABLE units_sold;


--Q41:

CREATE TABLE warehouse
(
  name VARCHAR(30),
  product_id INT,
  units INT,
  CONSTRAINT pk_warehouse PRIMARY KEY(name, product_id)
);

CREATE TABLE products
(
  product_id INT,
  product_name VARCHAR(30),
  width INT,
  length INT,
  height INT,
  CONSTRAINT pk_products PRIMARY KEY(product_id)
);

INSERT INTO warehouse VALUES('LCHouse1', 1, 1);
INSERT INTO warehouse VALUES('LCHouse1', 2, 10);
INSERT INTO warehouse VALUES('LCHouse1', 3, 5);
INSERT INTO warehouse VALUES('LCHouse2', 1, 2);
INSERT INTO warehouse VALUES('LCHouse2', 2, 2);
INSERT INTO warehouse VALUES('LCHouse3', 4, 1);

INSERT INTO products VALUES(1, 'LC-TV', 5, 50, 40);
INSERT INTO products VALUES(2, 'LC-KeyChain', 5, 5, 5);
INSERT INTO products VALUES(3, 'LC-Phone', 2, 10, 10);
INSERT INTO products VALUES(4, 'LC-T-Shirt', 4, 10, 20);

SELECT
  w.name,
  SUM(p.height*p.width*p.length*w.units) AS volume
FROM
  warehouse w
  JOIN products p ON w.product_id = p.product_id
GROUP BY
  w.name
;

--drop tables

DROP TABLE warehouse;
DROP TABLE products;


--Q42:

CREATE TABLE sales
(
  sale_date DATE,
  fruit VARCHAR(10),
  sold_num INT,
  CONSTRAINT pk_sales PRIMARY KEY(sale_date, fruit)
);

INSERT INTO sales VALUES('2020-05-01', 'apples', 10);
INSERT INTO sales VALUES('2020-05-01', 'oranges', 8);
INSERT INTO sales VALUES('2020-05-02', 'apples', 15);
INSERT INTO sales VALUES('2020-05-02', 'oranges', 15);
INSERT INTO sales VALUES('2020-05-03', 'apples', 20);
INSERT INTO sales VALUES('2020-05-03', 'oranges', 0);
INSERT INTO sales VALUES('2020-05-04', 'apples', 15);
INSERT INTO sales VALUES('2020-05-04', 'oranges', 16);

SELECT 
  sale_date,
  SUM(
    CASE 
      WHEN fruit = 'apples' 
        THEN sold_num
      WHEN fruit = 'oranges' 
        THEN (-1)*sold_num 
    END
  ) AS diff
FROM 
  sales
GROUP BY
  sale_date
ORDER BY
  sale_date
;

--drop tables

DROP TABLE sales;


--Q43:

CREATE TABLE activity
(
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT,
  CONSTRAINT pk_activity PRIMARY KEY(player_id, event_date)
);

INSERT INTO activity VALUES(1, 2, '2016-03-01', 5);
INSERT INTO activity VALUES(1 ,2, '2016-03-02', 6);
INSERT INTO activity VALUES(2, 3, '2017-06-25', 1);
INSERT INTO activity VALUES(3, 1, '2016-03-02', 0);
INSERT INTO activity VALUES(3, 4, '2018-07-03', 5);

WITH logged_in_prev_day AS(
  SELECT
    count(DISTINCT player_id) AS player_count
  FROM
    activity a1
  WHERE
    EXISTS(
      SELECT
        *
      FROM
        activity a2
      WHERE
        a1.player_id = a2.player_id
        AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY)
    )
),
all_player AS(
  SELECT
    count(DISTINCT player_id) AS total_player_count
  FROM
    activity
)
SELECT
  ROUND(
    (SELECT
      player_count
    FROM
      logged_in_prev_day)*1.00/
    (SELECT
      total_player_count
    FROM
    all_player)
  ,2) AS fraction
;

--drop tables

DROP TABLE activity;


--Q44:

CREATE TABLE employee
(
  id INT,
  name VARCHAR(30),
  department VARCHAR(30),
  manager_id INT,
  CONSTRAINT pk_employee PRIMARY KEY(id)
);

INSERT INTO employee VALUES(101, 'John', 'A', null);
INSERT INTO employee VALUES(102, 'Dan', 'A', 101);
INSERT INTO employee VALUES(103, 'James', 'A', 101);
INSERT INTO employee VALUES(104, 'Amy', 'A', 101);
INSERT INTO employee VALUES(105, 'Anne', 'A', 101);
INSERT INTO employee VALUES(106, 'Ron', 'B', 101);

WITH RECURSIVE emp_hir AS  
(
  SELECT
    id,
    manager_id, 
    1 as lvl 
  FROM 
    employee 
  WHERE
    manager_id is null
  UNION
  SELECT 
    em.id,
    em.manager_id, 
    eh.lvl + 1 as lvl 
  FROM
    emp_hir eh 
    JOIN employee em ON eh.id = em.manager_id
)
SELECT 
  emp.name 
FROM 
  emp_hir eh1
  JOIN employee emp ON emp.id = eh1.manager_id
GROUP BY 
  eh1.lvl,
  eh1.manager_id,
  emp.name
HAVING 
  COUNT(*) >= 5
;

--drop tables

DROP TABLE employee;


--Q45:

CREATE TABLE department
(
  dept_id INT,
  dept_name VARCHAR(30),
  CONSTRAINT pk_department PRIMARY KEY(dept_id)
);

CREATE TABLE student
(
  student_id INT,
  student_name VARCHAR(30),
  gender VARCHAR(1),
  dept_id INT,
  CONSTRAINT pk_student PRIMARY KEY(student_id),
  CONSTRAINT fk_department FOREIGN KEY (dept_id)
    REFERENCES department(dept_id) 
);

INSERT INTO department VALUES(1, 'Engineering');
INSERT INTO department VALUES(2, 'Science');
INSERT INTO department VALUES(3, 'Law');

INSERT INTO student VALUES(1, 'Jack', 'M', 1);
INSERT INTO student VALUES(2, 'Jane', 'F', 1);
INSERT INTO student VALUES(3, 'Mark', 'M', 2);

SELECT
  d.dept_name,
  count(
    CASE
      WHEN s.dept_id IS NOT NULL
        THEN d.dept_id
    END
  ) AS student_number
FROM
  department d
  LEFT JOIN student s ON d.dept_id = s.dept_id
GROUP BY
  d.dept_id,
  d.dept_name
ORDER BY
  student_number DESC,
  dept_name
;

--drop tables

DROP TABLE student;
DROP TABLE department;


--Q46:

CREATE TABLE customer
(
  customer_id INT,
  product_key INT
);

CREATE TABLE product
(
  product_key INT,
  CONSTRAINT pk_product PRIMARY KEY(product_key)
);

INSERT INTO customer VALUES(1, 5);
INSERT INTO customer VALUES(2, 6);
INSERT INTO customer VALUES(3, 5);
INSERT INTO customer VALUES(3, 6);
INSERT INTO customer VALUES(1, 6);

INSERT INTO product VALUES(5);
INSERT INTO product VALUES(6);

SELECT 
  customer_id
FROM 
  customer 
GROUP BY 
    customer_id
HAVING 
  COUNT(distinct product_key) = (SELECT COUNT(*) FROM product)
;

--drop tables

DROP TABLE customer;
DROP TABLE product;


--Q47:

CREATE TABLE project
(
  project_id INT,
  employee_id INT,
  CONSTRAINT pk_project PRIMARY KEY(project_id, employee_id)
);

CREATE TABLE employee
(
  employee_id INT,
  name VARCHAR(30),
  experience_years INT,
  CONSTRAINT pk_employee PRIMARY KEY(employee_id)
);

INSERT INTO project VALUES(1, 1);
INSERT INTO project VALUES(1, 2);
INSERT INTO project VALUES(1, 3);
INSERT INTO project VALUES(2, 1);
INSERT INTO project VALUES(2, 4);

INSERT INTO employee VALUES(11, 'Khaled', 3);
INSERT INTO employee VALUES(2, 'Ali', 2);
INSERT INTO employee VALUES(3, 'John', 3);
INSERT INTO employee VALUES(4, 'Doe', 2);

WITH employee_exp_serialized AS(
  SELECT
    e.employee_id,
    p.project_id,
    DENSE_RANK() OVER(PARTITION BY p.project_id ORDER BY e.experience_years DESC) as experience_serial
  FROM
    employee e
    JOIN project p ON p.employee_id = e.employee_id
)
SELECT
  project_id,
  employee_id
FROM
  employee_exp_serialized
WHERE 
  experience_serial = 1
;

--drop tables

DROP TABLE project;
DROP TABLE employee;


--Q48:
--No Orders data

CREATE TABLE books
(
  book_id INT,
  name VARCHAR(30),
  avaialable_from DATE,
  CONSTRAINT pk_books PRIMARY KEY(book_id)
);

CREATE TABLE orders
(
  order_id INT,
  book_id INT,
  quantity INT,
  dispatch_date DATE,
  CONSTRAINT pk_orders PRIMARY KEY(order_id),
  CONSTRAINT fk_orders FOREIGN KEY (book_id)
    REFERENCES books(book_id) 
);

INSERT INTO books VALUES(1, 'Kalila And Demna', '2010-01-01');
INSERT INTO books VALUES(2, '28 Letters', '2012-05-12');
INSERT INTO books VALUES(3, 'The Hobbit', '2019-06-10');
INSERT INTO books VALUES(4, '13 Reasons Why', '2019-06-01');
INSERT INTO books VALUES(5, 'The Hunger Games', '2008-09-21');

WITH last_year_sales AS(
  SELECT
    o.book_id,
    sum(quantity) AS total_sold
  FROM
    orders o
  WHERE
    o.dispatch_date >= DATE_SUB("2019-06-23", INTERVAL 1 YEAR)
  GROUP BY
    o.book_id
)
SELECT 
  b.name
FROM
  books b
  LEFT JOIN last_year_sales l_y_sales ON b.book_id = l_y_sales.book_id
WHERE
  (
    l_y_sales.total_sold < 10
    OR l_y_sales.total_sold is NULL
  )
  AND b.avaialable_from <= DATE_SUB("2019-06-23", INTERVAL 1 MONTH)
;

--drop tables

DROP TABLE orders;
DROP TABLE books;


--Q49:

CREATE TABLE enrollments
(
  student_id INT,
  course_id INT,
  grade INT,
  CONSTRAINT pk_enrollments PRIMARY KEY(student_id, course_id)
);

INSERT INTO enrollments VALUES(2, 2, 95);
INSERT INTO enrollments VALUES(2, 3, 95);
INSERT INTO enrollments VALUES(1, 1, 90);
INSERT INTO enrollments VALUES(1, 2, 99);
INSERT INTO enrollments VALUES(3, 1, 80);
INSERT INTO enrollments VALUES(3, 2, 75);
INSERT INTO enrollments VALUES(3, 3, 82);

WITH serailized_enrollments AS(
  SELECT
    *,
    DENSE_RANK()
      OVER(PARTITION BY student_id ORDER BY grade DESC, course_id) AS serial
  FROM
    enrollments
)
SELECT
  student_id,
  course_id,
  grade
FROM
  serailized_enrollments
WHERE
  serial = 1
;

--drop tables

DROP TABLE enrollments;


--Q50:

CREATE TABLE players
(
  player_id INT,
  group_id INT,
  CONSTRAINT pk_players PRIMARY KEY(player_id)
);

CREATE TABLE matches
(
  match_id INT,
  first_player INT,
  second_player INT,
  first_score INT,
  second_score INT,
  CONSTRAINT pk_matches PRIMARY KEY(match_id)
);

INSERT INTO players VALUES(15, 1);
INSERT INTO players VALUES(25, 1);
INSERT INTO players VALUES(30, 1);
INSERT INTO players VALUES(45, 1);
INSERT INTO players VALUES(10, 2);
INSERT INTO players VALUES(35, 2);
INSERT INTO players VALUES(50, 2);
INSERT INTO players VALUES(20, 3);
INSERT INTO players VALUES(40, 3);

INSERT INTO matches VALUES(1, 15, 45, 3, 0);
INSERT INTO matches VALUES(2, 30, 25, 1, 2);
INSERT INTO matches VALUES(3, 30, 15, 2, 0);
INSERT INTO matches VALUES(4, 40, 20, 5, 2);
INSERT INTO matches VALUES(5, 35, 50, 1, 1);

WITH player_score AS(
  SELECT
    p.group_id,
    p.player_id,
    SUM(CASE
      WHEN p.player_id = m.first_player
        THEN m.first_score
      WHEN p.player_id = m.second_player
        THEN m.second_score
    END) AS score
  FROM
    players p
    JOIN matches m ON p.player_id = m.first_player OR p.player_id = m.second_player
  GROUP BY
    p.group_id,
    p.player_id
),
ranked_player AS(
  SELECT
    group_id,
    player_id,
    score,
    DENSE_RANK() OVER (PARTITION BY group_id ORDER BY score DESC,player_id) AS player_rank
  FROM
    player_score
)
SELECT
  group_id,
  player_id
FROM  
  ranked_player
WHERE
  player_rank = 1
;

--drop tables

DROP TABLE players;
DROP TABLE matches;
