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