DROP PROCEDURE IF EXISTS user_insert;

CREATE PROCEDURE user_insert(IN loop_num int)
AS $$
DECLARE
  i INT DEFAULT 1;
  j INT;
  n INT;
BEGIN
  j := loop_num / 10;
  WHILE i <= loop_num
  LOOP
    n := FLOOR(1 + RANDOM() * 100);
    INSERT INTO users(name, maiden_name, status, age) VALUES('taro' || n, null, 1, n);
    IF MOD(i, j) = 0 THEN
        INSERT INTO users(name, maiden_name, status, age) VALUES('jiro', 'oldtaro', 2, n);
    END IF;
    i := i + 1;
  END LOOP;
  INSERT INTO users(name, maiden_name, status, age) VALUES('saburo', 'oldtaro', 3, n);
END;
$$
LANGUAGE plpgsql;
