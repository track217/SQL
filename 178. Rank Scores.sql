178Rank Scores  对分数排序，同分排名相同，排名之间不跳跃，1234
表Scores
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
返回
+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

解法一：表一定要有别名，702ms，先得到包含各个分数的表tmp，再从另外一个表中数>=Score的个数作为排名Rank
SELECT S2.Score,(    
      SELECT COUNT(*)
      FROM (SELECT DISTINCT S1.Score AS s 
            FROM Scores AS S1) AS tmp
      WHERE s >= S2.Score
    ) AS Rank
FROM Scores AS S2
ORDER BY S2.Score DESC
