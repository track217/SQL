596. Classes More Than 5 Students
表courses
+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
返回
+---------+
| class   |
+---------+
| Math    |
+---------+
解法：利用class分组，再计数，设置>4
SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) > 4
