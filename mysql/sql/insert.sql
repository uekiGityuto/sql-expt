DROP PROCEDURE IF EXISTS user_insert;
DELIMITER $$

CREATE PROCEDURE user_insert(IN loop_num int)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT;
  SET j = loop_num / 10;
  WHILE i <= loop_num DO
    INSERT INTO user(name, maiden_name, status, age) VALUES("taro", null, 1, FLOOR(1 + RAND() * 100));
    IF MOD(i, j) = 0 THEN
        INSERT INTO user(name, maiden_name, status, age) VALUES("jiro", "oldtaro", 2, FLOOR(1 + RAND() * 100));
    END IF;
    SET i = i + 1;
  END WHILE;
  INSERT INTO users(name, maiden_name, status, age) VALUES('saburo', 'oldtaro', 3, FLOOR(1 + RANDOM() * 100));
END$$

DELIMITER ;
