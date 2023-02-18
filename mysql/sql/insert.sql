DROP PROCEDURE IF EXISTS user_insert;

DELIMITER $$

CREATE PROCEDURE user_insert(IN loop_num int)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT;
  DECLARE n INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
  BEGIN
    GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
    SELECT @sqlstate, @errno, @text;
    ROLLBACK;
  END;
  START TRANSACTION;
  SET j = loop_num / 10;
  WHILE i <= loop_num DO
    SET n = FLOOR(1 + RAND() * 100);
    INSERT INTO users(name, maiden_name, status, age) VALUES(CONCAT('taro', n), null, 1, n);
    IF MOD(i, j) = 0 THEN
        INSERT INTO users(name, maiden_name, status, age) VALUES(CONCAT('jiro', n), 'oldtaro', 2, n);
    END IF;
    SET i = i + 1;
  END WHILE;
  INSERT INTO users(name, maiden_name, status, age) VALUES(CONCAT('saburo', n), 'oldtaro', 3, n);
  COMMIT;
  SELECT 'Success!' AS result FROM DUAL;
END$$

DELIMITER ;
