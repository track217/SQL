601. Human Traffic of Stadium
表stadium
+------+------------+-----------+
| id   | date       | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).
返回
+------+------------+-----------+
| id   | date       | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+

SELECT S1.*
FROM stadium AS S1, stadium AS S2, stadium AS S3
WHERE ((S1.id + 1 = S2.id AND S1.id + 2 = S3.id)
    OR (S1.id - 1 = S2.id AND S1.id + 1 = S3.id)
    OR (S1.id - 2 = S2.id AND S1.id - 1 = S3.id))
    AND S1.people >= 100
    AND S2.people >= 100
    AND S3.people >= 100
GROUP BY S1.id;
