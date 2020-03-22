<?php

// 命名規則
// 変数名: ローワースネークケース
// クラス名: アッパーキャメルケース
// メソッド名: ローワーキャメルケース
// 定数: アッパースネークケース

// constant
const APP_NAME = 'exmple';

// string
$str = '文字列';

// integer
$int = 123;

// array
$ary = ['value1', 'value2'];

// associative array
$ary = ['key1'=>'value1', 'key2'=>'value2'];
$ary = [
  'key1'=>'value1',
  'key2'=>'value2',
];

// class
class ConcreteUser extends AbstractParent implements IInterface
{
  // properties
  public $variable1 = 'value1';
  protected $variable2 = 'value2';
  private $variable3 = 'value3';

  // static method
  static public function create($name)
  {
    // immplements...
    return 0;
  }

  // instance method
  public function thisCreate($name)
  {
    // immplements...
    return 0;
  }
}

// abstract class
abstract class AbstractParent
{
  abstract public function thisCreate($name);
}

// interface
interface IInterface
{
  static public function create($name);
  public function thisCreate($name);
}

// abstract classとinterfaceの違い
// abstract classは実装を強制しつつ、メソッドを定義し、小クラスからそのメソッドを使用できる。なお、インスタンスは生成できない。
// interfaceは実装を強制できるだけ。ただし、classではないので多重継承を実現できる。

// instanceの生成とmethodの呼び出し
$user = new ConcrateUser;
$user = new ConcrateUser($arg);

$user->thisCreate();

// static methodの呼び出し
ConcrateUser::create();
