180. Consecutive Numbers
表Logs  找到全部至少连续出现三次的数字 
+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
返回
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
依次比较相邻三行的数据
SELECT DISTINCT L1.Num AS ConsecutiveNums
FROM Logs AS L1, Logs AS L2, Logs AS L3 
WHERE L1.Id = L2.Id - 1 AND L2.Id = L3.Id - 1 AND L1.Num = L2.Num AND L2.Num = L3.Num;

使用联结 
SELECT DISTINCT L1.Num AS ConsecutiveNums
FROM Logs AS L1
    JOIN Logs AS L2 ON L1.Id = L2.Id - 1
    JOIN Logs AS L3 ON L2.Id = L3.Id - 1
WHERE L1.Num = L2.Num AND L2.Num = L3.Num
