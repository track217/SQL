表Employee
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
表Deparment
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
返回
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+

雇员表的部门ID等于部门表ID，并且他是部门最高薪水的人
SELECT D.Name AS Department, E.Name AS Employee, E.Salary 
FROM Employee AS E, Department AS D 
WHERE E.DepartmentId = D.Id AND (DepartmentId,Salary) IN 
  (
  SELECT DepartmentId, MAX(Salary) AS MAX 
  FROM Employee 
  GROUP BY DepartmentId
  );
  
解法二：使用 ALL,表2的部门ID和表1的部门ID相等，表1的薪水大于等于表2的，763ms
先选一个人，然后找他的部门，然后他的工资最高，输出该人
SELECT D.Name AS Department, E1.Name AS Employee, E1.Salary AS Salary
FROM Employee AS E1, Department AS D
WHERE E1.DepartmentId = D.Id AND 
        E1.Salary >= ALL(SELECT E2.Salary 
                        FROM Employee AS E2
                        WHERE E2.DepartmentId = E1.DepartmentId);
                        
解法三：新建一个最大工资表T,从雇员表中选出  符合最大工资表的部门+工资， 部分ID匹配
SELECT D.Name AS Department, E.Name AS Employee, E.Salary 
FROM Employee AS E, Department AS D,
    (SELECT DepartmentId, MAX(Salary) AS MAX 
     FROM Employee 
     GROUP BY DepartmentId) AS T
WHERE E.DepartmentId = T.DepartmentId 
      AND E.Salary = T.MAX
      AND E.DepartmentId = D.id;


