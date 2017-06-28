185 Department Top Three Salaries
表Employee
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
+----+-------+--------+--------------+
表Department
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
要求返回下表
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Joe      | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
思路：设置过滤条件，同部门工资比他高的小于3个，1186ms

SELECT D.Name AS Department, E.Name AS Employee, E.Salary AS Salary
FROM Depariment AS D, Employee AS E
WHERE D.Id = E.DepartmentId AND (SELECT COUNT(Salary)
                                 FROM Employee
                                 WHERE DepartmentId = D.Id AND Salary > E.Salary)<3
ORDER BY D.Name, E.Salary DESC;                                 
