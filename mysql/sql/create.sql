DROP TABLE IF EXISTS users;
CREATE TABLE users (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  maiden_name VARCHAR(255),
  status TINYINT UNSIGNED NOT NULL,
  age SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE INDEX idx_status_age ON users (status, age);
CREATE INDEX idx_maiden_name ON users (maiden_name);


DROP TABLE IF EXISTS books;
CREATE TABLE books (
	book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (book_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ON UPDATEは指定していないのでデフォルトのRESTRICTになっている（users.user_idの更新拒否）
-- MySQLはデフォルトで外部キーにインデックスがつく
ALTER TABLE books
  ADD CONSTRAINT fk_users_user_id FOREIGN KEY (user_id)
	REFERENCES users (user_id)
	ON DELETE CASCADE
;

