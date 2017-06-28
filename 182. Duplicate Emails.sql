182找到全部重复的邮箱
表Person
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

解法一：使用WHERE,757ms
SELECT DISTINCT P1.Email
FROM Person AS P1, Person AS P2
WHERE P1.Id != P2.Id AND P1.Email = P2.Email

解法二：使用GROUP BY和HAVING COUNT ,筛选分组，712ms
SELECT Email 
FROM Person
GROUP BY Email
HAVING COUNT(*)>1

解法三：使用JOIN联结，773ms
SELECT DISTINCT P1.Email
FROM Person AS P1 JOIN Person AS P2 ON (P1.Id != P2.Id) AND (P1.Email = P2.Email);
