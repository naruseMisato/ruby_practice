# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元は配列とか繰り返し処理とかについて

# ==============================================

# 配列 ========

# いろんな型のデータを入れられるʕ•ᴥ•ʔ

p array = [1, 2, "test", 3]

# 要素外のものを取得しようとしてもエラーにならずnilになるʕ•ᴥ•ʔ

p array[100] # -> nil

# 適当なところにデータを入れると、エラーにならずにその間の要素はnilが入るʕ•ᴥ•ʔおお〜

array[10] = 50
p array # -> [1, 2, "test", 3, "test2", nil, nil, nil, nil, nil, 50]

# 消す時も安全ʕ•ᴥ•ʔ

array.delete_at(100) # -> nil
p array # -> 何も変わらない

# ただ末尾にデータを入れたい場合ʕ•ᴥ•ʔ直感的に書けるね

p array << "test2" # -> [1, 2, "test", 3, nil, nil, nil, nil, nil, nil, 50, "test2"]

# 配列の多重代入
# こうすると、配列の中身はリセットされちゃうみたいʕ•ᴥ•ʔ
# てっきり、arrayの方は、配列の末尾によしなにインサートされるのかと思った..w
# 多重配列、使い道あるのかな..P89にある、dimodメソッドとか特殊すぎないかって思うんだけども

array, array2 = [1, 2, 3] # ３は無視されるよ!
p array # -> 1
p array2 # -> 2

# ブロック ========

# for文はあんまり使わないらしい -> 繰り返し処理を使うʕ•ᴥ•ʔ
# $0とか使えばdo以降省略できるかなって思ったけどできなかったw(-> もうちょい下の&とシンボル、を見るべし)
# ブロック引数を使わない場合にdo以降を省略する

array = [1, 2, "test", 3]
array.each do |data|
    p data
end

# いろんな型が混じってる場合で、型指定のメソッドを叩くとコンパイルエラーになるʕ•ᴥ•ʔ

array3 = [1, 2, 3]
array3.delete_if do |data|
    data.odd?
end
p array3 # -> [2]

# array4 = [1, 2, 3, "a", "bbb"]
# array4.delete_if do |data|
#     data.odd?
# end
# p array4 # -> ERROR! undefined method `odd?' for "a":String

# do..endを使わない方がswiftぽくてわかりやすいかもʕ•ᴥ•ʔ
# でも、本には、「開業を含む長いブロックを書く場合はdo..endを使う」って書いてある(´・ω・｀)

# array5 = nil # 配列に代入したい場合はnilだとエラーになるのはswiftと同じだね〜
array5 = []
array.each { |data|
    array5 << data
}

p array5

# mapも配列を作り直すからそのまま代入できるʕ•ᴥ•ʔ
# 文字列をintに変えると0に変わるんだ(°_°)

p array6 = array.map { |data|
    data.to_i # -> [1, 2, "test", 3] -> [1, 2, 0, 3]
}

# collectも同じ感じʕ•ᴥ•ʔ

array7 = array6.select { |data|
    p data if data % 2 == 0 # -> 2と0が取れる
}

# findは、firstWhereみたいなのʕ•ᴥ•ʔシンプルにかけて良い

p array8 = array6.find { |data|
    data.even? # -> 2
}

# injectはエイリアスメソッドがreduce.使い方は言わずもがなswiftのreduceと同じʕ•ᴥ•ʔ

p sum = array6.inject { |datas, data|
    datas + data # -> 6
}

# &とシンボルを使うともっとシンプルになるʕ•ᴥ•ʔ
# 上の方で「$0とか使えばdo以降省略できるかなって思ったけどできなかったw」って書いてるけどこうすればそういうことができるʕ•ᴥ•ʔ！
# でも、$0と違って、演算子を使う場合とか、{}のなかで処理をしたい時には使えないから結構違うかも

p array6.map(& :to_i) # -> [1, 2, 0, 3]
# p array6.map(& % 3 == 0) # -> ERROR! wrong argument type FalseClass (expected Proc) (TypeError)

# 範囲

# for文とか使わなくてもindexを指定して範囲を絞れる

p array6[0...2] # -> [1, 2]

def getName(input)
    p (1..3).include?(input)
end
getName(gets.to_i) # -> true

# case文も扱える

# case age
# when 0..5
#   0
# when 6..10
#   10
# end

# 例題：RGB

def changeRGB(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r, g, b].map do |e|
    e.hex
  end
end

puts changeRGB("#ffffff") # -> 255 255 255

# 値の取得ʕ•ᴥ•ʔ

p array[-1] # 末尾の要素を取れる
p array.last #↑同じく
# p array[-100] # -> ERROR!要素がいを指定しちゃダメ
