181 Employees Earning More Than Their Managers
表Employee

| Id | Name  | Salary | ManagerId |
|----|-------|--------|-----------|
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |


解法一：使用 WHERE,1122ms
SELECT E1.Name AS Employee
FROM Employee AS E1, Employee AS E2
WHERE E1.ManagerId = E2.Id AND E1.Salary > E2.Salary;

解法二:使用 JOIN ON, 1028ms
SELECT E1.Name AS Employee
FROM Employee AS E1 JOIN Employee AS E2 ON (E1.ManagerId = E2.Id) AND (E1.Salary > E2.Salary);
