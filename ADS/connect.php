<?php
  $host="localhost";                //replace with your hostname
  $username="root";     //replace with your username
  $password="";             //replace with your password
  $db_name="test_ads"; 
               //replace with your database
  $con=mysql_connect("$host", "$username", "$password")or die("cannot connect");
  mysql_select_db("$db_name") or die ("cannot select DB");

  $sql = "select * from tab1";    //replace with your table name
  $result = mysql_query($sql);

  $json = array();
  $count=0;
  
  if(mysql_num_rows($result)){
    while($row=mysql_fetch_row($result)) {
      $count = $count+1;
      $json["movie".$count]=$row;
    }
  }

  mysql_close($con);
  echo json_encode($json);
?>
