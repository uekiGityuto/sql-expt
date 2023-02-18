DROP PROCEDURE IF EXISTS user_insert;

CREATE PROCEDURE user_insert(IN loop_num int)
AS $$
DECLARE
  i INT DEFAULT 1;
  j INT;
BEGIN
  j := loop_num / 10;
  WHILE i <= loop_num
  LOOP
    INSERT INTO users(name, maiden_name, status, age) VALUES('taro', null, 1, FLOOR(1 + RANDOM() * 100));
    IF MOD(i, j) = 0 THEN
        INSERT INTO users(name, maiden_name, status, age) VALUES('jiro', 'oldtaro', 2, FLOOR(1 + RANDOM() * 100));
    END IF;
    i := i + 1;
  END LOOP;
  INSERT INTO users(name, maiden_name, status, age) VALUES('saburo', 'oldtaro', 3, FLOOR(1 + RANDOM() * 100));
END;
$$
LANGUAGE plpgsql;
