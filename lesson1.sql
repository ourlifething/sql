INSERT INTO members(id,name,depart,age,updated)
VALUES(1,'山田太郎','営業部',40,'2014-12-01');

INSERT INTO members(name,age)
VALUES('鈴木さくら',25);

INSERT INTO members
VALUES(3,'佐藤二郎','人事部', 35,'2015-01-15')

INSERT INTO members(name,depart,age)
VALUES
('田中一郎','経理部',48),
('山口弘子','営業部',28),
('渡辺順次','人事部',58),
('中嶋博之','総務部',49),
('山下敬吾','経理部',23);

/* SELECT 見たいもの FROM テーブル名 検索条件 */
SELECT * FROM members;

SELECT name FROM members;

SELECT name,age FROM members;

/* WHERE 検索対象 */
SELECT * FROM members WHERE age = 25;
SELECT * FROM members WHERE age > 25;
SELECT * FROM members WHERE age >= 25;

/* <> 〇〇ではない */
SELECT * FROM members WHERE age <> 25;

SELECT * FROM members WHERE age > 25 AND age < 40;

SELECT * FROM members WHERE age > 25 OR updated <= '2015-01-15';/*2015/01/15 可*/

SELECT * FROM members WHERE updated BETWEEN '2015-01-15' AND '2015-02-15'/*端含む*/

SELECT * FROM members WHERE depart IN('営業部','人事部');

/*NULLの判定 IS NULL / IS NOT NULL*/
SELECT * FROM members WHERE updated IS NULL;
SELECT * FROM members WHERE updated IS NOT NULL;

/* 鈴木で始まる... */
SELECT * FROM members WHERE name LIKE '鈴木%'

SELECT * FROM members WHERE name LIKE '%木%' /* 木を含む */

SELECT * FROM members WHERE name LIKE '%子';

SELECT * FROM members WHERE name NOT LIKE '%北%'/* 北を含まない */

/* ORDER BY */
SELECT * FROM members ORDER BY age DESC; /* 降順  ASCがデフォルト昇順 */

/* WHERE 絞り込み ORDER BY 並び替え */
SELECT * FROM members WHERE updated IS NOT NULL ORDER BY age ASC;

SELECT * FROM members ORDER BY age DESC, name ASC;

/* 上位3件 */
SELECT * FROM members ORDER BY age DESC LIMIT 3;

SELECT * FROM members ORDER BY age DESC LIMIT 3 OFFSET 1;

UPDATE members SET depart ='人事部' WHERE name = '鈴木さくら';

UPDATE members SET depart = '人事部', age = age+1 WHERE name = '鈴木さくら';

/* WHEREがないと全て消去 */
DELETE FROM members WHERE id= 3;

/* データ件数 */
SELECT count(*) FROM members;

/* 年齢の平均 */
SELECT avg(age) FROM members;

SELECT max(age) FROM members;

SELECT min(age) FROM members;

SELECT sum(age) FROM members;

/* 部署毎の平均年齢 ...*/
SELECT depart,avg(age) FROM members GROUP BY depart;

SELECT depart,avg(age) FROM members GROUP BY depart HAVING avg(age) >= 30;

