<?php
/**
 * Created by PhpStorm.
 * User: Joao
 * Date: 18-07-2015
 * Time: 12:55
 */

$directory = './downloads';
$scanned_directory = array_diff(scandir($directory), array('..', '.'));
//print_r($scanned_directory);

$r = count($scanned_directory);
$checksum  = array();

for ($x = 2; $x <= $r+1; $x++) {
    $checksum[$scanned_directory[$x]] = md5_file($directory.'/'.$scanned_directory[$x]);
}

echo json_encode($checksum);
//print_r($checksum);