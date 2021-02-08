<?php

$host=".\SQLEXPRESS";
$connectionInfo = array("Database"=>"ADS", "UID"=>"test", "PWD"=>"Password1234");
//$connectionInfo = array("Database"=>"ADS");

$conn = sqlsrv_connect($host, $connectionInfo);

if( $conn ) {
     //echo "Connection established.<br />";
}else{
     //echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}

$json = array();
$counter = 0;

$sql = "SELECT * FROM dbo.Temas";
$stmt = sqlsrv_query( $conn, $sql );
if( $stmt === false) {
    die( print_r( sqlsrv_errors(), true) );
}

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC) ) {
	$counter = $counter + 1;
	$json["temas".$counter] = $row;
    //echo $row['ID']."<br />";
}

$counter = 0;

$sql = "SELECT * FROM dbo.Topicoes";
$stmt = sqlsrv_query( $conn, $sql );
if( $stmt === false) {
    die( print_r( sqlsrv_errors(), true) );
}

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC) ) {
	$counter = $counter + 1;
	$json["topicos".$counter] = $row;
    //echo $row['ID']."<br />";
}

echo json_encode($json);

sqlsrv_free_stmt( $stmt);

// Close the connection.
sqlsrv_close( $conn );

?>