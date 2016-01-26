# qreki_compare_vs_swift
Foundation の NSCalendar 旧暦(NSCalendarIdentifierChinese)の挙動が怪しいので
[旧暦計算サンプルスクリプト](http://www.vector.co.jp/soft/dos/personal/se016093.html) の各実装との実行結果を比べるスクリプトを作ってみました。

## Install

Download Repository

    $ git clone git@github.com:fujikky/qreki_compare_vs_swift.git

Add Python script
http://d.hatena.ne.jp/fgshun/20091127/1259302979

    $ curl -O http://www.lazy-moon.jp/soft/qreki_py/qreki-0.4.6.zip
    $ unzip qreki-0.4.6.zip
    $ mv qreki-0.4.6 src/qreki_py
    $ rm qreki-0.4.6.zip

Add PHP script
http://d.hatena.ne.jp/babu_babu_baboo/20131129/1385688401
    $ (copy source code from website)
    $ pbpaste > src/qreki.php

Add Ruby script
https://github.com/ozamasa/qreki

    $ bundle install

Compile Swift script
    $ make

## Run

Test 2001-01-01 ... 2002-12-31 in All languages

    $ bundle exec bin/qreki_compare_vs_swift 2001-2002

Test 2010-01-01 ... 2010-12-31 in Ruby and Swift

    $ bundle exec bin/qreki_compare_vs_swift 2010 swift

Test 2017-03-10 ... 2017-03-20 in Python and Swift

    $ bundle exec bin/qreki_compare_vs_swift 2017-03-10...2017-03-20 python

## Result

Pythonの実装が一番精度が高そうなので採用することに。

2015:
- 問題なし。

```
$ bundle exec bin/qreki_compare_vs_swift 2015 python
> Success: 365, Error: 0
```

2016:
- 問題なし。

```
$ bundle exec bin/qreki_compare_vs_swift 2016 python
> Success: 366, Error: 0
```

2017:
- 大量のエラーが出た。
- http://www.ajnet.ne.jp/diary/?yy=2017&mm=06&youbi=0&history=-3
- ここを見る限りは、 Python の結果のほうが正解っぽい。
- 閏月の計算が逆になっている

```
$ bundle exec bin/qreki_compare_vs_swift 2017 python
> Success: 276, Error: 89
original:2017-06-24, python:2017-05-01 L, swift:2017-06-01
original:2017-06-25, python:2017-05-02 L, swift:2017-06-02
(省略)
original:2017-07-21, python:2017-05-28 L, swift:2017-06-28
original:2017-07-22, python:2017-05-29 L, swift:2017-06-29
original:2017-07-23, python:2017-06-01, swift:2017-06-01 L
original:2017-07-24, python:2017-06-02, swift:2017-06-02 L
(省略)
original:2017-08-20, python:2017-06-29, swift:2017-06-29 L
original:2017-08-21, python:2017-06-30, swift:2017-06-30 L
```

2018:
- 問題なし。

```
$ bundle exec bin/qreki_compare_vs_swift 2018 python
> Success: 366, Error: 0
```

2019:
- エラーあり。
- 10月の終わりが29日、30日の間でずれており、一ヶ月分の結果がずれている

```
$ bundle exec bin/qreki_compare_vs_swift 2019 python
> Success: 335, Error: 30
original:2019-11-26, python:2019-10-30, swift:2019-11-01
original:2019-11-27, python:2019-11-01, swift:2019-11-02
original:2019-11-28, python:2019-11-02, swift:2019-11-03
(省略)
original:2019-12-23, python:2019-11-27, swift:2019-11-28
original:2019-12-24, python:2019-11-28, swift:2019-11-29
original:2019-12-25, python:2019-11-29, swift:2019-11-30
```

2020:
- エラーあり。
- 1月の終わりが29日、30日の間でずれており、一ヶ月分の結果がずれている

```
$ bundle exec bin/qreki_compare_vs_swift 2019 python
> Success: 336, Error: 30
original:2020-02-23, python:2020-01-30, swift:2020-02-01
original:2020-02-24, python:2020-02-01, swift:2020-02-02
original:2020-02-25, python:2020-02-02, swift:2020-02-03
(省略)
original:2020-03-21, python:2020-02-27, swift:2020-02-28
original:2020-03-22, python:2020-02-28, swift:2020-02-29
original:2020-03-23, python:2020-02-29, swift:2020-02-30
```

# Future
- Appleにバグ報告するかどうか
