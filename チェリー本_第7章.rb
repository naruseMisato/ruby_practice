# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元はクラスとかについて

# ==============================================

# init:「initialize」でinitが呼ばれる

class Mubappe
  def initialize(age)
    p "ムバッペは#{age}歳です"
  end

  def get_name
    "むーちゃん"
  end
end

pet = Mubappe.new(1.5)
p pet # -> "ムバッペは1.5歳です"
p pet.get_name # -> "むーちゃん"

# インスタンス変数

class Mubappe2
  def initialize(age, name)
    # @name = name
    p "#{name}は#{age}歳です"
  end

  def get_name
    @name
  end
end

pet2 = Mubappe2.new(1.5, "むーちゃん")
p pet2 # -> "むーちゃんは1.5歳です"
p pet2.get_name # -> "むーちゃん"

# ※↑init内の「@name = name」を消すと、
p pet2.get_name # -> nil
