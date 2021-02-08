<?php


$host = ".\SQLEXPRESS";
$connectionInfo = array("Database"=>"ADS", "UID"=>"test", "PWD"=>"Password1234");
//$connectionInfo = array("Database"=>"ADS");

$conn = sqlsrv_connect($host, $connectionInfo);

if ($conn) {
  // echo "Connection established. <br />";
}
else {
  // echo "Connection failed. <br />";
  die(print_r( sqlsrv_errors(), true));
}

$json = array();

/************************************************** 
 *                                                *
 *       Get data of table Theme     *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Theme";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Theme".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table Topic        *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Topic";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Topic".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table SubTopic      *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.SubTopic";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["SubTopic".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table ThemeContent      *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.ThemeContent";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["ThemeContent".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table TopicContent            *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.TopicContent";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["TopicContent".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table SubTopicContent          *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.SubTopicContent";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["SubTopicContent".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table Language              *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Language";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Language".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table Phrase                 *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Phrase";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Phrase".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table EntityType             *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.EntityType";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["EntityType".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table EntityTypeLanguage          *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.EntityTypeLanguage";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["EntityTypeLanguage".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table EntityLanguage                *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.EntityLanguage";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["EntityLanguage".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table Entity     *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Entity";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Entity".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table Vertex        *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Vertex";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Vertex".$counter] = $row;
}

/************************************************** 
 *                                                *
 *   Get data of table Country       *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.Country";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["Country".$counter] = $row;
}

/************************************************** 
 *                                                *
 *         Get data of table CountryLanguage            *
 *                                                *
 **************************************************/

$counter = 0;

$sql = "SELECT * FROM dbo.CountryLanguage";
$stmt = sqlsrv_query($conn, $sql);

if ($stmt == false){
  die(print_r( sqlsrv_errors(), true));
}

while ($row = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_NUMERIC))
{
  $counter = $counter + 1;
  $json["CountryLanguage".$counter] = $row;
}

// Return the array with all of the data from the tables
echo json_encode($json);

sqlsrv_free_stmt($stmt);

// Close connection
sqlsrv_close($conn);

?>