"welcome to address book service"

UC1:create a Address Book Service DB

mysql> CREATE DATABASE AddressBookService;
Query OK, 1 row affected (1.79 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| addressbookservice |
| classicmodels      |
| information_schema |
| mysql              |
| newschema          |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
10 rows in set (0.09 sec)

mysql> USE AddressBookService;
Database changed

UC2: creating table
mysql> create table AddressBook
 -> (
 ->firstName varchar(30) not null,
 ->lastName varchar(30) not null,
 ->address varchar(255) not null,
 ->city varchar(30) not null,
 ->state varchar(30) not null,
 ->zip int not null,
 ->phoneNumber bigint  unique,
 ->email varchar(60) unique
 );
Query OK, 0 rows affected (0.58 sec)

mysql> desc addressbook;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(30)  | NO   |     | NULL    |       |
| lastName    | varchar(30)  | NO   |     | NULL    |       |
| address     | varchar(255) | NO   |     | NULL    |       |
| city        | varchar(30)  | NO   |     | NULL    |       |
| state       | varchar(30)  | NO   |     | NULL    |       |
| zip         | int          | NO   |     | NULL    |       |
| phoneNumber | bigint       | YES  | UNI | NULL    |       |
| email       | varchar(100) | YES  | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.05 sec)

UC3: insert data into table
mysql> insert into addressbook(firstName,lastName,address,city,state,zip,phoneNumber,email) values
('ujjawal','kumar','gorakhpur','gorakhpur','up',273017,9988776655,'ujjawal123@gmail.com'),
('raj','kumar','kunraghat','gorakhpur','up',273018,9988776656,'raj23@gmail.com'),
('omkar','kumar','rajendra nagar','siwan','bihar',841226,9988776657,'omkar023@gmail.com'),
('sarita','kumari','saketpuram','delhi','delhi',234632,9988776658,'sarita09@gmail.com'),
('sewika','kumari','ramnagar','ranchi','jharkhand',841288,9988776650,'sewika98@gmail.com');
Query OK, 5 rows affected (0.14 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from addressbook;
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| firstName | lastName | address        | city      | state     | zip    | phoneNumber | email                |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| ujjawal   | kumar    | gorakhpur      | gorakhpur | up        | 273017 |  9988776655 | ujjawal123@gmail.com |
| raj       | kumar    | kunraghat      | gorakhpur | up        | 273018 |  9988776656 | raj23@gmail.com      |
| omkar     | kumar    | rajendra nagar | siwan     | bihar     | 841226 |  9988776657 | omkar023@gmail.com   |
| sarita    | kumari   | saketpuram     | delhi     | delhi     | 234632 |  9988776658 | sarita09@gmail.com   |
| sewika    | kumari   | ramnagar       | ranchi    | jharkhand | 841288 |  9988776650 | sewika98@gmail.com   |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
5 rows in set (0.06 sec)

UC5: edit existing contact person using their name
mysql> update addressbook
    -> set zip=273016, address='isawarpur'
    -> where firstName = 'ujjawal';
Query OK, 1 row affected (0.11 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from addressbook;
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| firstName | lastName | address        | city      | state     | zip    | phoneNumber | email                |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| ujjawal   | kumar    | isawarpur      | gorakhpur | up        | 273016 |  9988776655 | ujjawal123@gmail.com |
| raj       | kumar    | kunraghat      | gorakhpur | up        | 273018 |  9988776656 | raj23@gmail.com      |
| omkar     | kumar    | rajendra nagar | siwan     | bihar     | 841226 |  9988776657 | omkar023@gmail.com   |
| sarita    | kumari   | saketpuram     | delhi     | delhi     | 234632 |  9988776658 | sarita09@gmail.com   |
| sewika    | kumari   | ramnagar       | ranchi    | jharkhand | 841288 |  9988776650 | sewika98@gmail.com   |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
5 rows in set (0.06 sec)

UC5: ability to delete person using person name
mysql> delete from addressbook
    -> where firstName='raj';
Query OK, 1 row affected (0.14 sec)

mysql> select * from addressbook;
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| firstName | lastName | address        | city      | state     | zip    | phoneNumber | email                |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| ujjawal   | kumar    | isawarpur      | gorakhpur | up        | 273016 |  9988776655 | ujjawal123@gmail.com |
| omkar     | kumar    | rajendra nagar | siwan     | bihar     | 841226 |  9988776657 | omkar023@gmail.com   |
| sarita    | kumari   | saketpuram     | delhi     | delhi     | 234632 |  9988776658 | sarita09@gmail.com   |
| sewika    | kumari   | ramnagar       | ranchi    | jharkhand | 841288 |  9988776650 | sewika98@gmail.com   |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+

UC6: retrive person belongs to city or state
mysql> select * from addressbook
    -> where city='delhi';
+-----------+----------+------------+-------+-------+--------+-------------+--------------------+
| firstName | lastName | address    | city  | state | zip    | phoneNumber | email              |
+-----------+----------+------------+-------+-------+--------+-------------+--------------------+
| sarita    | kumari   | saketpuram | delhi | delhi | 234632 |  9988776658 | sarita09@gmail.com |
+-----------+----------+------------+-------+-------+--------+-------------+--------------------+
1 row in set (0.00 sec)

mysql> select * from addressbook
    -> where city='delhi' or state='up';
+-----------+----------+------------+-----------+-------+--------+-------------+----------------------+
| firstName | lastName | address    | city      | state | zip    | phoneNumber | email                |
+-----------+----------+------------+-----------+-------+--------+-------------+----------------------+
| ujjawal   | kumar    | isawarpur  | gorakhpur | up    | 273016 |  9988776655 | ujjawal123@gmail.com |
| sarita    | kumari   | saketpuram | delhi     | delhi | 234632 |  9988776658 | sarita09@gmail.com   |
+-----------+----------+------------+-----------+-------+--------+-------------+----------------------+
2 rows in set (0.00 sec)

UC7:size of addressbook by city and state
mysql> select count(city), count(state)
    -> from addressbook;
+-------------+--------------+
| count(city) | count(state) |
+-------------+--------------+
|           4 |            4 |
+-------------+--------------+
1 row in set (0.00 sec)

UC8: Retrieve entries sorted alphabetically
mysql> select * from addressbook
    -> order by firstName;
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| firstName | lastName | address        | city      | state     | zip    | phoneNumber | email                |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
| omkar     | kumar    | rajendra nagar | siwan     | bihar     | 841226 |  9988776657 | omkar023@gmail.com   |
| sarita    | kumari   | saketpuram     | delhi     | delhi     | 234632 |  9988776658 | sarita09@gmail.com   |
| sewika    | kumari   | ramnagar       | ranchi    | jharkhand | 841288 |  9988776650 | sewika98@gmail.com   |
| ujjawal   | kumar    | isawarpur      | gorakhpur | up        | 273016 |  9988776655 | ujjawal123@gmail.com |
+-----------+----------+----------------+-----------+-----------+--------+-------------+----------------------+
4 rows in set (0.02 sec)
