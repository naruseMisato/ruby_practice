# チェリー本の覚えたい要点を書いてくよ＼＼\\٩( 'ω' )و //／／
# 特有の感じとか、swiftと違うところとかを意識する

# この単元はクラスとかについて

# ==============================================

# init:「initialize」でinitが呼ばれるʕ•ᴥ•ʔ

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

# インスタンス変数ʕ•ᴥ•ʔ
# グローバル変数的に一番外側に書くとかしないでinitないで定義しても、別メソッドから呼び出せるらしいʕ•ᴥ•ʔ

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

# method=(引数)で、代入用のメソッドになるʕ•ᴥ•ʔ

class Mubappe3
    def initialize(age, name)
      @name = name
      p "#{name}は#{age}歳です"
    end
  
    def update_name=(value)
        @name = value
    end

    def get_name
        @name
    end
  end

pet3 = Mubappe3.new(1.5, "むーちゃん")
pet3.update_name = "ムバッペ"
p pet3.get_name

# メソッドの公開レベル

# publicはswiftと同じʕ•ᴥ•ʔ

# privateʕ•ᴥ•ʔ

class Mubappe4
    def hello
        "hello.#{get_name}" # self.get_nameにするとエラーになるよ
    end

    private
    def get_name
        "むーちゃん"
    end
end

pet4 = Mubappe4.new
p pet4.hello # -> "hello.むーちゃん"

class Animal
    private
    def mammal
        "哺乳類"
    end
end

# privateはサブクラスの中でも呼び出せるʕ•ᴥ•ʔ
# selfをつけたクラスメソッドの場合はprivateでも呼び出せるʕ•ᴥ•ʔ

class Mubappe5 < Animal
    def get_name
        "むーちゃんは#{mammal}だ"
    end

    private
    def mammal
        "両生類"
    end

    private
    def self.get_age
        "1.5歳です"
    end
end 

pet5 = Mubappe5.new
p pet5.get_name # -> "むーちゃんは両生類だ"：同じメソッドで定義したら、overrideした側のメソッドが呼び出される
# mammalをMubappe5クラスから削除する -> "むーちゃんは哺乳類だ"

# class << selfをつけるとクラスメソッドが外部から呼べなくなるʕ•ᴥ•ʔ

class Mubappe6 < Animal
    class << self
        def get_name
            "むーちゃんは#{mammal}だ"
        end

        private
        def mammal
            "両生類"
        end

        private
        def self.get_age
            "1.5歳です"
        end
    end
end 

# p Mubappe6.get_age # -> ERROR!undefined method `get_age'

# 公開レベルを変更

class Mubappe7
    def get_name
        "むーちゃん"
    end

    private :get_name
end

pet7 = Mubappe7.new
# p pet7.get_name # -> ERROR!private method `get_name'

# protected
# →メソッドを定義したクラス自身とそのサブクラスのインスタンスメソッドから「レシーバ付き」で呼び出せるʕ•ᴥ•ʔ
# ※レシーバ：呼び出しクラス自身のこと（"Mubappe7"）
# →外部には公開したくないけど、参照したい場合に使うʕ•ᴥ•ʔ

class Mubappe8
    def initialize(name, age)
        @name = name
        @age = age
    end

    def getGuineaPigAge(value)
        "#{value.name}のモルモット年齢は#{value.age * 10}です"
    end

    def name
        @name
    end

    protected
    def age
        @age
    end
end

pet8 = Mubappe8.new("むーちゃん", 1.5)
pet8_ = Mubappe8.new("むーちゃん", 2)

p pet8.getGuineaPigAge(pet8_)
p pet8.name # -> "むーちゃん"
# p pet8.age # -> ERROR!protected method `age' called for #<Mubappe8:0x00007f7f4e056cc8 @name="むーちゃん", @age=1.5> 

# でもって、protectedをprivateに直すと、↓のエラーに変わるぞʕ•ᴥ•ʔ

class Mubappe9
    def initialize(name, age)
        @name = name
        @age = age
    end

    def getGuineaPigAge(value)
        "#{value.name}のモルモット年齢は#{value.age * 10}です"
    end

    def name
        @name
    end

    private
    def age
        @age
    end
end

pet9 = Mubappe9.new("むーちゃん", 1.5)
pet9_ = Mubappe9.new("むーちゃん", 2)

# p pet9.getGuineaPigAge(pet9_) # -> ERROR!private method `age' called for #<Mubappe8:0x00007fc20a856d70 @name="むーちゃん", @age=2>
p pet9.name # -> "むーちゃん"
# p pet9.age # -> ERROR!private method `age' called for #<Mubappe8:0x00007f7f4e056cc8 @name="むーちゃん", @age=1.5>