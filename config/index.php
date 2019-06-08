<?php
echo "Container IP Address: " . $_SERVER['SERVER_ADDR'];
echo "<br/>";

$headers =  getallheaders();
foreach($headers as $key=>$val){
  echo $key . ': ' . $val . '<br>';
}
?>
