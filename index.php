<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 01.11.2016
 * Time: 19:16
 */

require 'vendor/autoload.php';

$url = 'http://unizoo.ru/test/test_normal.php'; // 200
//$url = 'http://unizoo.ru/test/test_500.php'; // 500
//$url = 'http://unizoo.ru/test/test_empty.php'; //empty
//$url = 'http://not.local';
//$url = 'http://unizoo.ru/test/test_timeout.php';

$replace = [
    'little dog' => 'boy',
    'cat' => 'dog',
    'home' => 'street'
];

$wordFind = 'My';
$wordChange = 'His';

$html = new L2cri\Url\Parser();

$html->setUrl($url);
print_r($html->setContent());

print_r($html->changeByArray($replace));
print_r($html->changeByWord($wordFind,$wordChange));

$restore = new L2cri\Url\RestoreParser($url,$html->getContent());

print_r($restore->changeByArray($replace));
print_r($restore->changeByWord($wordFind,$wordChange));
