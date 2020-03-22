全てがオブジェクト
  文字列、配列はもちろん、数値、nil、true、falseもオブジェクト

メソッドの呼び出し
  オブジェクトのメソッドを呼び出し
    object.method(引数1, 引数2, 引数3)
  引数のカッコ省略
    object.method 引数1, 引数2, 引数3
  引数なし
    object.method

文の区切り
  改行、セミコロンが文の区切り。
    1.to_s
    nil.to_s; 10.to_s(16)
  カッコが締められてない、バックスラッシュで文はまだ続く
    10.to_s(
    16
    )

    10.to_x \
    16

リテラル
  数値
    123
  文字列
    'Hello' %q(Hello) %s(Hello)←シンボル
  文字列(変数展開可)
    "Hello" %(Hello)
  シンボル
   :hello :'hello' :'123'
  配列
    [1, 2, 3] %w(1 2 3) %W(1 2 3)←変数展開可能
  配列(シンボル)
    [:Ruby, :Python, :PHP] %i(Ruby Python PHP)
  ハッシュ
    {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
  ハッシュ(シンボル)
    {japan: :yen, us: :dollar, india: :rupee}
  正規表現
    /[\w\d]+/

バックスラッシュでエスケープ

変数宣言と配列操作
  変数宣言
    s = 'hello'
  同時代入
    a, b = 1, 2
  配列へ追加
    ary << 3
  配列展開
   [1, 2, *ary] #=> [1, 2, 1, 2, 3]

変数の種類
  ローカル変数
    name
    スコープ内のみ参照可能
  定数
    NAME
    クラス内だとどこでも参照可能
    クラス外は
    Class::NAME Module::NAME
    の形で参照可能
    Rubyでは書き換え可能なので.freezeメソッドを使うかマジックコメントを使う
  インスタンス変数
    @name
    インスタンスメソッドのみ参照可能
  クラスインスタンス変数
    @name
    クラス直下とクラスメソッドのみのみ参照可能
  クラス変数
    @@name
    クラス全体とそのクラスの親子メソッド全てのみ参照可能
  グローバル変数
    $name
    どこからでも参照可能
  組み込み変数、定数
    $
    Rubyが定義した変数、元から持っている定数
  環境変数
    ENV['name']
    OS、マシンが持っている環境変数

命名規則
  スネークケース
    変数名、メソッド名、ファイル名
  キャメルケース
    クラス名、モジュール名
  すべて大文字
    定数

比較演算子
  ==, !=, <, >, <=, >=

真偽値と条件分岐
  基本形if
    if 条件式 && 条件式 || 条件式
      trueの処理
    elsif 条件式
      trueの処理
    else
      falseの処理
    end

  一行で書く(Guard句)
    trueの処理 if 条件式

  三項演算子
    条件式 ? trueの処理 : falseの処理

  true falseだけ返したいとき
    !!条件式

  ifの逆、unless
    unless 条件式
      falseの処理
    end

  case文
    case 対象
    when 条件
      trueの処理
    end

範囲(Range)
  1..5
  'a'..'e'
  ...を使うと5が範囲に含まれない(1以上5未満)
  1...5

繰り返し処理
  each map select find inject 配列に対して
  times upto downto step 数値に対して

  ループ処理
  loop do #breakされるまで
    break #処理から抜け出す
  end

  while 条件式 #真だったら実行
    next #次の周回へ
    redo #今の周回をやり直す
  end

  until 条件式 #偽だったら続行
  end

  for 変数 in 配列やハッシュ #eachメソッドと一緒 使わぬように
  end

  大域脱出
  catch :done do
    throw :done
  end

クラス
  サンプル
    class User
      DEFAULT_PRICE = 100
      @pet = 'cat'

      attr_accessor :name, :price

      def initialize(name, price) #newの際にこれが呼ばれる デフォルトでprivateメソッド
        # 初期化処理
        @name = name #newの引数をインスタンス変数に代入
        @price = price
      end

      def hello #インスタンスメソッド
        "Hello, I am #{@name}."
      end

      def self.this_class #クラスメソッド
        "Userクラス"
      end
    end

  クラスの定義
    class User

    end

  オブジェクトの作成
    user = User.new('Alice', 100)

  インスタンスメソッドの定義
    def hello #インスタンスメソッド
      "Hello, I am #{@name}."
    end
    以上のように普通にメソッドの定義を行うとインスタンスメソッドになる

  インスタンスメソッドの呼び出し
    user.hello #=> "Hello, I am Alice."

  アクセサメソッド
    attr_accessorがアクセサメソッド、以下の二つを併せ持つ
      attr_writer
        セッターメソッド
          def name=(value)
            @name = value
          end

          user.name = 'Alice'
          以上のようにインスタンス変数に代入するメソッド
      attr_reader
        ゲッターメソッド
          def name
            @name
          end

          user.name #=> "Alice"
          以上のようにインスタンス変数を外部から参照するメソッド

  クラスメソッドの定義
    def self.this_class
      "Userクラス"
    end
    メソッド名にself.をつけるとクラスメソッドになる

    class User

      class << self
        # ここにクラスメソッドを定義(selfなし)
      end
    end
    以上のようにすることでself.をつけなくても定義が可能

  クラスメソッドの呼び出し
    User.this_class
    クラス名から呼びだす

  メソッド名の表記法
    インスタンスメソッドの表記法
      "User#hello"
    クラスメソッドの表記法
      "User.this_class" "User::this_class"

  定数の呼び出し
    クラス内であれば
      DEFAULT_PRICE
    クラス外であれば
      User::DEFAULT_PRICE

  selfキーワード
    クラス直下だとクラス自身
      User
    クラスメソッド内もクラス自身
      User
    インスタンスメソッド内だとそのクラスのインスタンスを表す
       <User:0x007fbffc094070>
      なのでインスタンスメソッド内ではセッターメソッドの呼び出し時のみつける

  クラス内の定数やメソッド呼び出し
    クラス直下から呼び出す場合
      定数
        DEFAULT_PRICE
      クラスメソッド
        self.this_class
      インスタンスメソッド
        呼び出せない
      クラスインスタンス変数
        @pet
    クラスメソッドから呼び出す場合
      定数
        DEFAULT_PRICE
      クラスメソッド
        self.this_class
      インスタンスメソッド
        呼び出せない
      クラスインスタンス変数
        @pet
    インスタンスメソッドから呼び出す場合
      定数
        DEFAULT_PRICE
      クラスメソッド
        User.this_class
      インスタンスメソッド
        hello
      クラスインスタンス変数
        呼び出せない

  クラスの継承
    class DVD < Product; end
    継承する場合is_a関係を意識する(AはBである)

  メソッドのオーバーライド
    スーパークラスのメソッドと同名のメソッドを定義することでオーバーライドできる
      superでスーパークラスの同盟のメソッドを呼び出せる

  メソッドの公開レベル
    キーワードを記述した下のメソッドに適用される

    public
      クラス内外から自由に呼び出せる
      initialize以外はデフォルトでpublic
    private
      クラス外からでは呼び出せない(レシーバ付きで呼び出せない)
      インスタンスメソッドはprivate :hello のように引数を渡せば後から設定可能
        クラスメソッドをprivateにしたい場合
          ①class << self 構文の中でprivateキーワードを使う
          ②private_class_method :hello 構文を使い設定(定義した後)
    protected
      クラス外からでは呼び出せないがクラス内であればレシーバ付きで呼び出せる
        protected :hello で後から設定可能

  エイリアスメソッド
    メソッドを定義した後、
      alias greeeting hello
      alias エイリアスにしたいメソッド 元のメソッド

  メソッドの削除
    undef hello

    特異メソッド
      指定したオブジェクトのみ呼び出せるメソッド
        def alice.shuffle
          # 処理
        end

モジュール
  モジュールの定義
    module Greeter; end

  モジュールの活用方法５つ
    ①インスタンスメソッドとしてミックスイン
    ②クラスメソッドとしてミックスイン
    ③名前空間
    ④関数や定数の集まりとして定義
    ⑤設定値の保持

  ①②ミックスイン
    module Greeter
      def hello
        'hello'
      end
    end

    インスタンスメソッドとしてミックスイン
      include Greeter
    特異メソッド(クラスメソッド)としてミックスイン
      extend Greeter
    メソッドの優先度を変えつつインスタンスメソッドとしてミックスイン
      prepend Greeter
      ミックスイン先の同名メソッドよりモジュールのメソッドが先に呼ばれるようになる
      メソッドの探索順位はancestorsメソッドで確認

    クラスと同じでprivate, protectedその他機能が有効

  ③名前空間
    module Clock
      class Second; end
    end

    もしくは

    module Clock; end

    class Clock::Second; end

      モジュール外から該当モジュールにに属するクラスの呼び出し
        Clock::Second.new
      モジュール内から
        Second.new
      モジュールに属してないトップレベルの同名クラスの呼び出し
        ::Second.new

  ④関数や定数の集まりとして定義
    module Loggable
      def self.log
        # 処理
      end
    end

    もしくは

    module Loggable
      class << self
        def log
          # 処理
        end
      end
    end

    モジュールの特異メソッドとして呼び出し
      Loggable.log

    モジュールの特異メソッドとして機能させつつ、ミックスインとしても使う
    module Loggable
      class << self
        def log
          # 処理
        end
      end
      module_fuction :log
    end


    モジュールに定数を定義
      module Loggable
        PREFIX = '[LOG]'.freeze
      end

  ⑤設定値の保持
    gemなど、設定値を一元管理する為にだけ使用するパターン
      module AwesomeApi
        @base_url = ''
        @debug_mode = false

        class << self
          attr_accessor :base_url, :debug_mode
        end
      end

    設定値の保存
      AwesomeApi.base_url = 'http://example.com'
      AwesomeApi.debug_mode = true

    設定値の呼び出し
      AwesomeApi.base_url
      AwesomeApi.debug_mode

例外処理
  例外の補足
    begin
      例外が発生するかもしれない処理
    rescue => e
      retry #処理をやり直す
      例外が起こった場合の処理
    else
      例外が発生しなかった場合の処理
    ensure
      例外が有無に関わらず実行する処理
    end

    rescue => eとすることでeに例外オブジェクトが入る
      e.class
        例外のクラス
      e.message
        例外のメッセージ
      e.callback
        例外が起こった時のバックトレース

      処理をやり直す
        retry
        無限ループに注意

    else
      あまり使われない
      理由としてはbegin内でカバーできる為
      ただし、else節は補足されないという点が違う

    ensure
      終了する前に必ず実行したい処理がある時に使う
      returnは絶対に使わないこと(例外を握り潰す)

    メソッド内ではbegin, endを省略可能
      def method
        例外が発生するかもしれない処理
      rescue => e
        retry #処理をやり直す
        例外が起こった場合の処理
      end

  例外を発生させる
    raise ArgumentError, "引数が無効です #{argument}"
      第一引数に例外クラス、第二引数にメッセージ

  独自の例外クラスを作る
    class NoCountryError < StandardError

    end

    必ず、継承元をStandardErrorにすること
