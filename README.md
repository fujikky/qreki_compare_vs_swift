# qreki_compare_ruby_vs_swift
Foundation の NSCalendar 旧暦(NSCalendarIdentifierChinese)の挙動が怪しいので
rubyと比べるスクリプトを作ってみました。

## Install

Download Repository

    $ git clone git@github.com:fujikky/qreki_compare_ruby_vs_swift.git

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
