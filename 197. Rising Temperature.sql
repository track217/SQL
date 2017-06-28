197和昨天相比提高温度
表Weather
+---------+------------+------------------+
| Id(INT) | Date(DATE) | Temperature(INT) |
+---------+------------+------------------+
|       1 | 2015-01-01 |               10 |
|       2 | 2015-01-02 |               25 |
|       3 | 2015-01-03 |               20 |
|       4 | 2015-01-04 |               30 |
+---------+------------+------------------+
返回
+----+
| Id |
+----+
|  2 |
|  4 |
+----+
思路：使用TO_DAYS函数比较日期

SELECT W2.Id 
FROM Weather AS W1, Weather AS W2
WHERE W2.Temperature > W1.Temperature AND TO_DAYS(W2.Date) - TO_DAYS(W1.Date) = 1

还可以使用DATEDIFF函数
SELECT W2.Id 
FROM Weather AS W1, Weather AS W2
WHERE DATEDIFF(W2.Date, W1.Date) = 1 AND W2.Temperature > W1.Temperature
