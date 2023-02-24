-- 総件数と101件目から10件取得
SELECT
  count(*) OVER () AS total_count,
  id,
  name,
  maiden_name,
  status,
  age
FROM users
LIMIT 10
OFFSET 100
;
