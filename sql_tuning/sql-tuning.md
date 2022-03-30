# DB Performance.Tuning

## DBが遅い原因
1. Queryの数が多い(SELECT, INSERT) 
2. 1本のQueryが遅い

***

## Queryの数が多い　Case SELECT
N+1問題が多い。
下記のMarkdownに解決方法も記載しています。
* [N＋1問題とは](N+1Problem.md "N+1Problem.md")


## Queryの数が多い　Case INSERT
INSERTが遅いケース
- バッチ処理
- データ移行
などを行う場合は大量のINSERTが発行されるようになります。

### 解決方法
    BULK INSERTを使う。
    BULK INSERTとは複数のINSERTを一つに纏める方法です。

```
INSERT INTO table (col1, col2) values ('val1, val2);
INSERT INTO table (col1, col2) values ('val1, val2);
INSERT INTO table (col1, col2) values ('val1, val2);

INSERT INTO table (col1, col2) values 
('val1, val2),
('val1, val2),
('val1, val2);
```
※※※BULK INSERTを使用すると速さが２０倍くらいに速くなるとの事です。後で試して見てくださいね。(^_^)

***

## 1本のQueryが遅い
>　Q:なぜDBの検索が遅くなるの？

例：
shops table
|  id   |  name  |
| :---: |  :---: |
| 1     |  ShwePuZon  |
| 2     |  MinLann   |

SELECT * FROM shops where name = 'ShwePuZon';

>　この場合は、データが２行あるうちから検索するのですぐに検索できます。

>　でもshopsテーブルに500万件あるとしたら、500万件をFullScanして条件と合うものを検索するようになり時間が掛かります。

>　Answer：データ量が多くなるのが原因でした。

>1本のQueryが遅くなった場合はTuningを行います。

***

## Tuningの流れ
- INDEXをはる
- 実行計画を確認
- Partitionをはる

### INDEXをはる
    INDEXの確認方法
    desc tablename
    show create table tablename

    desc menus;
    | Field    | Type            | Null | Key | Default | Extra         |
    +----------+-----------------+------+-----+---------+---------------+
    | id       | bigint unsigned | NO   | PRI | NULL   | auto_increment |
    | shop_id  | bigint          | NO   | MUL | NULL   |                |
    | name     | varchar(255)    | YES  |     | NULL   |                |
    +----------+-----------------+------+-----+--------+----------------+

> ※Primary KeyとForeign Keyはindexしなくても自動的にIndexを張られてる。

>　INDEXが張られてないカラムに注目しましょう。

>　例えば) 検索条件での中で name = 〇〇 で検索している場合、nameで検索しているのにINDEXが張られてない場合はnameカラムにINDEXをはりましょう。

>　INDEXを張った事でPerformanceが改善できればTuningはこれで終了。

>　INDEXを張ってもPerformanceが改善してない場合は次のスタップに行く必要があります。


### 実行計画を確認
DBの処理の流れ

```
                SQL文
                　↓
        +-------------------------+
        ｜　    パーサー            | sqlの構文のチェックを行う
        +-------------------------+
                 　↓
        +-------------------------+
        ｜　    オープティマイザ      |  実行計画 sqlをどう実行するかの計画を立てられます。
        +-------------------------+   FullScanするかIndexを使用するかなど判断する。
                 　↓
        +-------------------------+
        ｜　    　　処理            |
        +-------------------------+

```
> INDEXを張ってもオープティマイザの方でそのINDEXを使用する判断をしなければINDEXを張っても意味がありません。

> なのでINDEXを張ってもPerformanceが改善してない場合は実行計画を確認して本当にそのINDEXを使用しているかを確認してください。

> 実行計画を確認するCommandは EXPLAIN になります。

> EXPLAINで実行計画を確認した結果思い通りにINDEXが使われてない場合は
INDEXの張り方が悪いなのか？
もしくは検索SQLが悪いのか？など見直す事になります。

※※※※　INDEXを張ってもそれでも処理が遅い場合は最後の手段としてPartitionをはることに続きます。※※※※


### Partitionをはる
PartitionとはDBの検査を早くするためにテーブルを内部的に分割する事です。
|  Table  | 
| ---- | 
|  Partition 1  | 
|  Partition 2  | 

例）
shops table
|  id   |  prefecture   |  shop_name  |  created_at | 
| :---: |  :---:        | :---:       |  :---:      |
| 1  | Tokyo | TokyoShop  | 2022-01-01 |
| 2  | Osaka | Shop A     | 2022-01-01 |
| 3  | Osaka | Shop B     | 2022-01-01 |
| 4  | Tokyo | ShibuyaShop | 2022-01-01 |

|  Table  | 
| ---- | 
|  Tokyo Partition   |
|  Osaka Partition   |  
※ID 1と4はTokyo Partitionに、ID ２と３はOsaka Partitionに入るます。

SELECT * FROM shops where prefecture = 'Tokyo' and shop_name = 'ShibuyaShop';
> このsqlを実行するとPartition張ってない場合は、テーブルのFullScanをしなければなりません。

> Partitionを張る事でTokyo Partitionだけを見にいればいいからテーブルをFullScanしなくて検索が早くなる事です。

__注意点__
Partitionを張ると
- 外部キー制約が使えない
- Where句にキーカラムを含めないと意味ない。[ where prefecture = 'Tokyo']これがないとFullScanのままになるから
> PartitionよりもまずはINDEXで解決しましょう。どうしてもできない場合だけPartitionを使用する事にする。
