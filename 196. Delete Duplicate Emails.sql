196删除重复邮件
表Person
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
返回
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

两个表，比较ID,删除表1与表2邮箱相同，但表2ID较小的
DELETE P1
FROM Person AS P1, Person AS P2
WHERE P1.Email = P2.Email AND P1.Id > P2.Id;
