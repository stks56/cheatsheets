<?php

// 命名規則
// 変数名: ローワースネークケース
// クラス名: アッパーキャメルケース
// メソッド名: ローワーキャメルケース
// 定数: アッパースネークケース

// constant
const APP_NAME = 'exmple';
echo APP_NAME;

// string
$str = '文字列';
echo $str;

// integer
$int = 123;
echo $int;

// array
$ary = ['value1', 'value2'];
echo $ary[0];
echo $ary[1];

// associative array
$ary = ['key1'=>'value1', 'key2'=>'value2'];
$ary = [
  'key1'=>'value1',
  'key2'=>'value2',
];
echo $ary['key1'];
echo $ary['key2'];

// namespece and import class
namespace App\Class;

use Foo;
// alias
use Bar as Baz;
// 完全修飾
use OtherVendor\OtherPackage\BazClass;
// 関数をインポートします (PHP 5.6+)
use function My\Full\functionName;
// 関数のエイリアスを定義します (PHP 5.6+)
use function My\Full\functionName as func;
// 定数をインポートします (PHP 5.6+)
use const My\Full\CONSTANT;
