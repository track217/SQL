183从来没有ORDER的顾客
表Customers
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
表Orders
+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
返回
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

解法一：使用 WHERE和 NOT IN, 537ms
SELECT Name AS Customers
FROM Customers
WHERE Customers.Id NOT IN (SELECT CustomerId FROM Orders);

解法二：使用 WHERE 和 NOT EXISTS,487ms
SELECT Name AS Customers
FROM Customers
WHERE NOT EXISTS (SELECT Orders.Id FROM Orders WHERE Customers.Id = Orders.CustomerId);

解法三:使用左联结 LEFT JOIN ON ，顾客左联结Order，挑选出 Order是NULL的顾客  526ms
SELECT Name AS Customers
FROM Customers LEFT JOIN Orders ON Customers.ID = Orders.CustomerId
WHERE Orders.CustomerID IS NULL;



