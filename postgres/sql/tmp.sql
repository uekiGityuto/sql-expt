/**  結合と外部キー制約の実験  *//

\d users
\d books

INSERT INTO users(name, maiden_name, status, age) VALUES('taro', 'old_taro', 1, 1);
INSERT INTO books(user_id, name) VALUES(1, 'abc');

-- ONとUSINGの結果が同じ
SELECT u.user_id, u.name, b.book_id, b.name
FROM users u
INNER JOIN books b ON u.user_id = b.user_id
;

SELECT u.user_id, u.name, b.book_id, b.name
FROM users u
INNER JOIN books b USING (user_id)
;

-- CASCADEが効くこと
SELECT * FROM users;
SELECT * FROM books;
DELETE FROM users WHERE user_id = 1;
SELECT * FROM users;
SELECT * FROM books;

-- RESTRICTが効くこと
INSERT INTO users(name, maiden_name, status, age) VALUES('taro', 'old_taro', 1, 1);
INSERT INTO books(user_id, name) VALUES(2, 'abc');

UPDATE users
SET user_id = 10
WHERE user_id = 2
;

-- DROPはできない
DROP TABLE users;

-- books消せばDROPできる
DROP TABLE books;
DROP TABLE users;
