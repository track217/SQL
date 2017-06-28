181 雇员薪水高于他的领导
表Employee
+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+

解法1：使用WHERE,1122ms
SELECT E1.Name AS Employee
FROM Employee AS E1, Employee AS E2
WHERE E1.ManagerId = E2.Id AND E1.Salary > E2.Salary;

解法2:使用JOIN联结，使用FROM ON, 1028ms
SELECT E1.Name AS Employee
FROM Employee AS E1 JOIN Employee AS E2 ON (E1.ManagerId = E2.Id) AND (E1.Salary > E2.Salary);

SELECT d.Name Department, e.Name Employee, Salary
FROM Employee e, Department d
WHERE e.DepartmentId = d.Id AND e.Salary = (
    SELECT MAX(Salary)
    FROM Employee
    WHERE DepartmentId = d.Id
)
