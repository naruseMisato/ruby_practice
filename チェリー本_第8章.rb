# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元はモジュールとかについて

# ==============================================

# モジュールのミックスイン：is_aの関係でないが共通処理を呼びたい場合に使う

# include→インスタンスメソッドとして使うʕ•ᴥ•ʔ

module Animal
  def name(name)
    p name
  end

  private def name2(name)
    p name
  end
end

class Mubappe
  include Animal

  def get_name
    name("ムバッペ")
  end

  def get_name2
    name2("ムバッペ")
  end
end

mubappe = Mubappe.new
mubappe.get_name # -> "ムバッペ"
mubappe.get_name2 # -> ERRORのはずだけど呼び出せた。。。？

# extend→クラスメソッドとして使うʕ•ᴥ•ʔ

class Mubappe2
  extend Animal

  def self.get_name
    name("ムバッペ")
  end
end

# mubappe2 = Mubappe2.new
# mubappe2.get_name # -> ERROR!`get_name': undefined method `name'

Mubappe2.get_name # -> "ムバッペ"

# include先で定義されている前提で記述できるʕ•ᴥ•ʔ

module Animal3
  def get_name
    p "#{name}!!!"
  end
end

class Mubappe3
  include Animal3

  def name
    "ムバッペ"
  end
end

mubappe3 = Mubappe3.new
mubappe3.get_name # -> "ムバッペ!!!"

# Enumerable：map,count../Conparable：演算子系/Kernel：p,puts
# が使えるのもモジュールのおかげʕ•ᴥ•ʔ

# インスタンス変数も呼び出せるʕ•ᴥ•ʔあんまり良くない

module Animal4
  def rename
    @name = "むーちゃん"
  end
end

class Mubappe4
  include Animal4

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mubappe4 = Mubappe4.new("ムバッペ")
p mubappe4.name # -> "ムバッペ"
mubappe4.rename
p mubappe4.name # -> "むーちゃん"

# ↑なのでこの場合は、セッターを使ったほうがいいʕ•ᴥ•ʔ結果は同じ

module Animal5
  def rename
    self.name = "むーちゃん"
  end
end

class Mubappe5
  include Animal5

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# 名前空間の作成ʕ•ᴥ•ʔ

# module内でクラスを定義して使い分けるʕ•ᴥ•ʔ

module Marmot
  class Mubappe
    def initialize(name)
      p "#{name}はモルモットです。"
    end
  end
end

module Soccer
  class Mubappe
    def initialize(name)
      p "#{name}はサッカー選手です。"
    end
  end
end

Marmot::Mubappe.new("ムバッペ") # -> "ムバッペはモルモットです。"
Soccer::Mubappe.new("ムバッペ") # -> "ムバッペはサッカー選手です。"

# モジュール単体でも使えるʕ•ᴥ•ʔ

module Animal6
  def self.name(name)
    p name
  end
end

Animal6.name("ムバッペ")

# ミックスイン、単体、どっちでも使える設定のし方’ʕ•ᴥ•ʔ

module Animal7
  def name(name)
    p "#{name}はモルモットです。"
  end

  module_function :name
end

class Mubappe7
  include Animal7

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

Animal7.name("ムバッペ") # -> "ムバッペはモルモットです。"
mubappe7 = Mubappe7.new("ムバッペ")
p mubappe7.name # -> "ムバッペ"
