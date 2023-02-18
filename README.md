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
call user_insert({作成したい件数});
```

## よく使う SQL コマンド

```
show create table user;
show indexes from user;
select count(*) from user;
explain select count(*) from user where status = 2;
explain analyze select count(*) from user where status = 2;
analyze table user;
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
call user_insert({作成したい件数});
```

## よく使う SQL コマンド

```
\d users
select count(*) from users;
explain select count(*) from users where status = 2;
explain analyze select count(*) from users where status = 2;
analyze table user;
```

## ログアウト

```
exit
exit
```
