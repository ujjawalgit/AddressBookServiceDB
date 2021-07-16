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
