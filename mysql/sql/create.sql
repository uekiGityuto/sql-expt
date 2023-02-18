CREATE TABLE `user` (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  maiden_name VARCHAR(255),
  status TINYINT UNSIGNED NOT NULL,
  age SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE INDEX status_age_idx ON user (status, age);
CREATE INDEX maiden_name_idx ON user (maiden_name);
