176. Second Highest Salary
表Employee
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
返回
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

解法一：使用 MAX() 函数会返回NULL值，如果查询值不存在,786ms
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

解法二：使用LIMIT和OFFSET,设置取值的位置和个数，LIMIT只给定一个参数时，表示返回最大的记录行数，
如果给定两个参数，则第一个参数表示返回记录行的偏移量，第二个参数同上，666ms
SELECT 
  (
    SELECT DISTINCT Salary 
    FROM Employee
    ORDER BY Salary DESC LIMIT 1 OFFSET 1 #或写成LIMIT 1，1，822ms
   )  
AS SecondHighestSalary;


