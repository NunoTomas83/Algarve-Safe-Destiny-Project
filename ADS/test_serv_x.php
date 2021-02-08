<?php

$host=".\SQLEXPRESS";
$connectionInfo = array("Database"=>"ADS");

$conn = sqlsrv_connect($host, $connectionInfo);

if( $conn ) {
     echo "Connection established.<br />";
}else{
     echo "Connection could not be established.<br />";
     die( print_r( sqlsrv_errors(), true));
}

$sql = "SELECT ID FROM dbo.Temas";
$stmt = sqlsrv_query( $conn, $sql );
if( $stmt === false) {
    die( print_r( sqlsrv_errors(), true) );
}

while( $row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC) ) {
      echo $row['ID']."<br />";
}

sqlsrv_free_stmt( $stmt);

// Close the connection.
sqlsrv_close( $conn );

?>