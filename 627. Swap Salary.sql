627. Swap Salary 交换性别
表salary
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |


返回
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |

可以使用按位异或的方式，这想法很巧妙
('f','m','sex') 比如sex是f，那么结果会返回m  其中^是按位异或操作符 
UPDATE Salary
SET sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));

解法二，使用 CASE WHEN
UPDATE salary
SET sex = (CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END)
