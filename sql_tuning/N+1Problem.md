# N+1問題とは
N＋1問題とはループ処理の中でsqlを発行すると大量のsqlが多く増えて行く事です。

### 例）
shops table
|  id   |  name  |
| :---: |  :---: |
| 1     |  ShwePuZon  |
| 2     |  MinLann   |

menus table
|  id   |  shop_id  |  name  |
| :---: |  :---:    | :---:  |
| 1     | 1         | IceCream |
| 2     | 1         | Fa Lu Da |
| 3     | 1         | Fresh Fruit Juice |
| 4     | 1         | Cappuccino |
| 5     | 1         | Coffee Latte |
| 6     | 2         | Monti Soup |
| 7     | 2         | Monti Salad |
| 8     | 2         | Fisherman's curry |
| 9     | 2         | Seafood Salad |
| 10    | 2         | Crad curry |

```
<?php

$shopList = Shop::all(); // "SELECT * FROM shops;" ショップ一覧を取得
foreach($shopList as $shop) {
    echo $shop->name;

    $menuList = Menu::where('shop_id', '=', $shop->id);
    // SELECT * FROM menus where shop_id = 1;
    // SELECT * FROM menus where shop_id = 2; 2回SQL発行する事をLazyLoadとも言います。
    foreach($menuList as $menu) {
        echo $menu->name;
    }
}

?>
```

## N＋1問題を回避する方法
- JOIN する
- Eager Loadする

### JOIN する
SQLのJoinを使って一本釣りする
```
<?php

$resultList = Shop::select('shops.name', 'menu.name as menu')
                ->leftjoin('menus', 'shops.id', '=', 'menus.shop_id')
                ->orderBy('shops.id')
                ->get();
foreach($resultList as $result) {
    echo $result->name;
    echo $result->menu;
}

?>
```

### Eager Loadする
Eager Loadとは「先にデータを取得しておく」ことを eager loading を言うらしいです。
1本釣りまでは行かなくても予めSelectする事

```
<?php

$shopList = Shop::all(); // "SELECT * FROM shops;" ショップ一覧を取得
$ids = collect($shopList)->pluck('id')->all();
$menuList = Menu::whereIn('shop_id', $ids); // SELECT * FROM menus where shop_id IN (1, 2);

foreach($shopList as $shop) {
    echo $shop->name;
    $id = $shop->id;
    $filterMenu = $menuList->filter(function ($menu) use ($id) {
            return ($menu->shop_id === $id);
    });
    foreach($filterMenu as $menu) {
        echo $menu->name;
    }
}

?>
```

## 注意点
データをJoinとEagerLoadはデータ全てをを先に取得して処理する事で
- メモリ量オーバーに注意
  件数を区切りながら処理するのを考慮しましょう。

例：バッチ処理などには
```
<?php

  <!-- 1000件ずつ取得してから実施する -->
  User::query()->chunkByID(1000, function ($users) {
      foreach ($users as $user) {
        <!-- 処理実行 -->
      }
  }

?>
```

* [戻る](sql-tuning.md "sql-tuning.md")