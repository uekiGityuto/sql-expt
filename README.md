# 共通

## 起動

```
docker compose up -d
```

## 停止

```
docker compose down
```

# MySQL

## ログイン

```
docker exec -it mysql bash
mysql -umysql -pmysql -D expt
```

## データ作成

以下の sql を流す

- mysql/sql/create.sql
- mysql/sql/insert.sql

その後に以下を実行

```
CALL user_insert({作成したい件数});
```

## よく使う SQL コマンド

```
SHOW CREATE TABLE users;
SHOW INDEXES FROM users;
SELECT COUNT(*) FROM users;
EXPLAIN SELECT COUNT(*) FROM users WHERE status = 2;
EXPLAIN ANALYZE SELECT COUNT(*) FROM users WHERE status = 2;
ANALYZE TABLE users;
TRUNCATE TABLE users;
```

## ログアウト

```
exit
exit
```

# PostgreSQL

## ログイン

```
docker exec -it postgres bash
psql -U postgres -d expt
```

## データ作成

以下の sql を流す

- postgres/sql/create.sql
- postgres/sql/insert.sql

その後に以下を実行

```
CALL user_insert({作成したい件数});
```

## よく使う SQL コマンド

```
\timing
\d users
SELECT COUNT(*) FROM users;
EXPLAIN SELECT COUNT(*) FROM users WHERE status = 2;
EXPLAIN ANALYZE SELECT COUNT(*) FROM users WHERE status = 2;
ANALYZE users;
TRUNCATE TABLE user;
```

## ログアウト

```
exit
exit
```
