175. Combine Two Tables
Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
返回
FirstName, LastName, City, State

使用左联结
SELECT FirstName, LastName, City, State
FROM Person LEFT JOIN Address ON Person.PersonId = Address.PersonID;

SELECT FirstName, LastName, City, State
FROM Person LEFT JOIN Address USING(PersonId);
