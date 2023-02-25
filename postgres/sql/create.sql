DROP TABLE IF EXISTS users;
CREATE TABLE users (
  user_id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  maiden_name VARCHAR(255),
  status SMALLINT NOT NULL CHECK (age >= 0),
  age SMALLINT NOT NULL CHECK (age >= 0),
  PRIMARY KEY (user_id)
);

CREATE INDEX idx_status_age ON users (status, age);
CREATE INDEX idx_maiden_name_idx ON users (maiden_name);


DROP TABLE IF EXISTS books;
CREATE TABLE books (
	book_id SERIAL NOT NULL,
	user_id INT NOT NULL,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (book_id)
);

-- PostgresSQLのON DELETE, ON UPDATEのデフォルトはNO ACTION（MySQLはRESTRICT）
ALTER TABLE books
  ADD CONSTRAINT fk_users_user_id FOREIGN KEY (user_id)
	REFERENCES users (user_id)
	ON DELETE CASCADE
  ON UPDATE RESTRICT
;
-- PostgreSQLは何もしないと外部キーにインデックスがつかないので明示的につける
CREATE INDEX idx_user_id ON books (user_id);
