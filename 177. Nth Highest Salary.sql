177. Nth Highest Salary
表Employee
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
返回
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

使用 LIMIT,设置偏移量
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M = N-1;
  RETURN (
        SELECT DISTINCT Salary 
        FROM Employee
        ORDER BY Salary DESC LIMIT 1 OFFSET M
  );
END
