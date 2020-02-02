# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元は文字列とかif文とかそのあたりの基礎について

# ==============================================

# 引数がなければメソッドの()を省略できるʕ•ᴥ•ʔ

# -> String
puts 1.to_s

# -> Int
puts 1.to_i
puts 1.to_int

# 変数名はスネークケースʕ•ᴥ•ʔ

puts pet_name = "むーちゃん"

# 違う型を代入できる（多重代入）（できればやらない方が良い）

a = 1
puts a
a = "test"
puts a

# 一気に代入できるʕ•ᴥ•ʔ便利なようなそうでないような

b = c = 100
puts b
puts c

# 文字列は("")か('')が一般的.('')だと改行とか代入も文字列の一部と見なされるʕ•ᴥ•ʔ
# ジモティでは("")

puts "hello\n#{pet_name}"
puts 'hello\n#{pet_name}'

# if文を書かなくても比較って判断してくれるぽいʕ•ᴥ•ʔ

puts 1 == 1

# この辺はswiftと同じʕ•ᴥ•ʔ

puts d = 10 + 20
puts d += 30

# rubyでも暗黙の型変換はできないʕ•ᴥ•ʔ

# puts 1 + "2" -> ERROR!

# rubyはnilもfalse扱いでおkʕ•ᴥ•ʔ

e = nil
if e
    puts "eはnilじゃない"
else
    puts "eはnil"
end

# if文ごと代入できるʕ•ᴥ•ʔrubyではifは文ではなく式だから.

puts (
    if pet_name == "むーちゃん"
        pet_name
    else
        "だれ・・？"
    end
    )

# 後置ifもよく使うらしʕ•ᴥ•ʔ

puts pet_name if pet_name == "むーちゃん"

# メソッド定義ʕ•ᴥ•ʔメソッド名もスネークケース
# 引数がない場合は()はつけない.あっても省略できるけどあんまりしない
# 引数も型定義はしない
# returnはearlyリターンでない場合はつけない

def get_pet_name
    "むーちゃん"
end

puts get_pet_name

def get_pet_name2(is_formal_name)
    return "引数がない〜" if is_formal_name.nil?
    "むーちゃんの公式名はムバッペ" if is_formal_name
end

puts get_pet_name2(true)
puts get_pet_name2(nil)

# 例題：FizzBuzz

def fizz_buzz(input)
    if input % 3 == 0 && input % 5 == 0
        puts "Fizz Buzz"    
    elsif input % 5 == 0
        puts "Buzz"
    elsif input % 3 == 0
        puts "Fizz"
    else
        puts input
    end
end

fizz_buzz(gets.to_i)

# %を使う時はいろんなもので囲える.第3章の配列でもそうらしい
puts %q^Hello world^

# << ヒアドキュメントなるものがあるʕ•ᴥ•ʔ複数行文字列を書く時に使う
puts <<HTML
<div>
  <img src="xx.png">
</div>
HTML

# andやorは制御ロジックを書くのに向いてるʕ•ᴥ•ʔ
# &&や||より優先順位が低い＋andとorの優先度は同じ

# true && puts get_pet_name -> ERROR!"(true && puts)get_pet_name"こういう構造判定されるぽい
true and puts get_pet_name

# get_pet_name2はこういう書き方もできるʕ•ᴥ•ʔ!

def get_pet_name3(is_formal_name)
    is_formal_name or return "引数がない〜"
    if is_formal_name
        "むーちゃんの公式名はムバッペ"
    end
end

puts get_pet_name3(true)
puts get_pet_name3(nil)

# ifと逆のunless.elseifが使えない

puts f = unless true
    true
else
    false
end

# switch文＝case文
puts country = "japan"
case country
when "japan"
    "こんにちは"
when "amarica"
    "hello"
else
    "????"
end

# 三項演算子は同じʕ•ᴥ•ʔ

puts pet_name == "むーちゃん" ? "YES" : "NO"

# デフォルト引数も使えるʕ•ᴥ•ʔ

def get_pet_name4(is_formal_name = true)
    is_formal_name or return "引数がない〜"
    if is_formal_name
        "むーちゃんの公式名はムバッペ"
    end
end

puts get_pet_name4

# Boolを返すものは末尾に？をつけるのが慣習らしいʕ•ᴥ•ʔ

puts 1.nil?

# 「使う時は注意してね」メソッドの場合は末尾に！をつけるのが慣習らしいʕ•ᴥ•ʔ
# ↓こういうやつとか..?

def g!(xxx)
    puts xxx ? 1 : "nil"
end

g!(true)