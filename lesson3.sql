--カラム別名 AS(取得項目名をAS句の内容で表示)--
/*(カラム別名は文字列であってもコーテーションで囲う必要ない)*/

SELECT 
title AS タイトル,
price AS 価格,
FROM books;

--重複削除 DISTINCT(重複（javaで言う集合）をなくした状態で取得する)--
/*カテゴリー一覧を取得できる*/

SELECT 
DISTINCT 
category 
FROM books;


--取得カラムに書ける色々-- 
/*priceカラム、priceカラムに100足した値、固定値*/
SELECT
price,price+100,'Hello'
FROM books;

--切り捨て floor()--
/*計算結果の小数部を切り捨てる*/
SELECT
floor(120*1.08);

--３桁毎,挿入 format(値,小数点以下の桁数)--
SELECT format(12345678,0);

SELECT 
title AS タイトル,
format(price,0) AS 価格
FROM books;


--CASE WHEN (switch case的に分岐できる)--
/*データベースに付与して表示させる*/
/*categoryによって販売階を表示*/
/*CASE~END*/
SELECT
title AS 書名, category AS 分類,
CASE category
WHEN '雑誌' THEN '1F'
WHEN '漫画' THEN '1F'
ELSE '2F'
END AS 階
FROM books;


/*CASE WHEN (if的に分岐できる)*/
--プレゼント企画--
SELECT title AS 書名, price AS 価格,
CASE 
	WHEN price < 500 THEN 'えんぴつ'
	WHEN price < 1000 THEN 'キーホルダー'
	WHEN price < 3000 THEN 'ポスター'
	ELSE '腕時計'
END AS プレゼント
FROM books;


/*文字数 char_length()*/
SELECT title, char_length(title) FROM books;


/*現在日の入力 curdate()*/
INSERT INTO books(title,price,updated)
VALUES
('SQL入門',2800,curdate());


/*現在日時の入力 datetime型 now()*/
SELECT now()

/*文字列連結 concat(文字列,文字列,･・・)*/
SELECT concat(title, ':', price, '円')
FROM books;


/*最初のnullでない値を返す。 coalesce(引数,引数,･・・)*/
/*nullを書き換えたりする*/
/*updatedがnullのカラムは'更新日未記入'と表示*/
SELECT title, coalesce(updated, '更新日未記入')
FROM books;

/*副問い合わせ（サブクエリ）(最初にカッコ内の処理を行いその結果を利用)*/
/*一番高い本が複数ある場合など*/
SELECT title, price FROM books
WHERE price = (SELECT max(price) FROM books);

/*内部結合*/
/*内部結合 JOIN(それぞれのテーブルの指定した列の値が一致するデータだけを取得)*/
SELECT * FROM cds
JOIN categories
ON cds.cat_id=categories.id;

/*左結合*/
SELECT * FROM cds
LEFT JOIN categories
ON cds.cat_id=categories.id;

/*右結合*/
SELECT *FROM cds
RIGHT JOIN categories
on cds.cat_id=categories.id;

/*取得カラムの指定*/
SELECT cds.title,categories.category,cds.price FROM cds
LEFT JOIN categories
ON cds.cat_id=categories.id;

/*テーブル名に別名で上書き*/
SELECT t1.title,t2.category, t1.price 
FROM cds AS t1
LEFT JOIN categories AS t2
ON t1.cat_id = t2.id;
