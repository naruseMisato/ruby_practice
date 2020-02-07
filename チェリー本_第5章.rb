# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元はハッシュ、シンボルとかについて

# ==============================================

# ハッシュ ========
# swiftだとDictionary
# 複数の型をvalueに格納しておkʕ•ᴥ•ʔ

a = {"a" => "1", "b" => 2, "c" => "3"}
puts a["a"] # -> 1
a["d"] = "3"
puts a # -> {"a"=>"1", "b"=>2, "c"=>"3", "d"=>"3"}

# シンボル ========
# アドレスと同じようなもの -> 同一のオブジェクトʕ•ᴥ•ʔ

puts :test.object_id
puts :test.object_id # idが変わらない
puts "test".object_id
puts "test".object_id # idが変わる

# イミュータブルである

puts "test".upcase!

test = "test"
puts test.upcase! # (upcase: 大文字に変換する)

# :test = "test"
# puts :test.upcase! # -> ERROR! syntax error, unexpected '=', expecting end-of-input

# ハッシュのキーにシンボルを使うと文字列よりも早く取り出しができるʕ•ᴥ•ʔ
# (中身が整数なので普通の文字列よりも比較が早い)

b = {:a => "1", :b => "2", :c => "3"}
# シンボルを使うときは、省略できるのでこっちで書くのが一般的ʕ•ᴥ•ʔ
b = {a: "1", b: "2",c: "3"}
puts b

c = {a: :test, b: :test,c: :test}
puts c

# キーワード引数の定義＝ハッシュを使う、って感覚らしいʕ•ᴥ•ʔうおお

def getName(isPet:)
    if isPet
        "むーちゃん"
    else
        "だれ？"
    end
end

puts getName(isPet: true) # -> "むーちゃん"

# 例題：長さの単位変換プログラム

# 文字列ハッシュで書く場合

def convert_length(numeric:, before_converting:, after_converting:)
    units = { "m" => 1, "ft" => 3.28, "in" => 39.37 }
    puts numeric / units[before_converting] * units[after_converting]
end
convert_length(numeric: 1, before_converting: "m", after_converting: "ft")

# シンボルハッシュで書く場合

UNITS = { m: 1, ft: 3.28, in: 39.37 } # -> 大文字じゃないとダメらしい。ゴミʕ•ᴥ•ʔ
def convert_length2(numeric:, before_converting:, after_converting:)
    puts numeric / UNITS[before_converting] * UNITS[after_converting]
end
convert_length2(numeric: 1, before_converting: :m, after_converting: :ft)