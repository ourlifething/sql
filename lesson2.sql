SELECT * FROM books;
INSERT INTO books (category,title,price,updated) VALUES ('漫画','アラレちゃん','400','1978-12-11');

UPDATE books SET category = '小説' WHERE id=10;
DELETE FROM books WHERE title LIKE('図鑑');

