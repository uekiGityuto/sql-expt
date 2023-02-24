-- ステータス別の年齢ランキングを作成
SELECT
  id,
  name,
  maiden_name,
  status,
  age,
  RANK() OVER (PARTITION BY status ORDER BY age) AS age_rank
FROM users
;
