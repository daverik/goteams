<?php

	/*
	 * {
  "teams":[{"name":"IxD",...}],
  "leagues":[],
  "runners":[]
	}
	 */

    function getData ($data, $query, &$str) {
        while($row = mysql_fetch_array($query)) {
            $team = $row[$data];
            $str .= '"'.$team.'",';
        }
        $str = substr($str,0,strlen($str)-1);
        $str .= ']}';
    }
	 
    function formatData (&$output, $value, $str) {
        if(strlen($value) > 0) {
            $pattern = '/^'.$value.'/i';
            $json = json_decode($str);
       
            foreach($json->values as $item) {
                preg_match($pattern, $item, $matches);
                if(sizeof($matches) > 0) {
                    $output = $output.'"'.$item.'",';
                }
            }
        }
        $output = substr($output,0,strlen($output)-1).']}';
    }
     
	$dbcnx = @mysql_connect("localhost", "root", "root");
    mysql_select_db("lagvarvet", $dbcnx);
    mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);
	
	$value = $_POST['value'];
    
    $qTeams = mysql_query("SELECT title FROM team");
   
    $str = '{"values":[';
    $output = '{"teams":[';
    
	getData("title", $qTeams, $str);
    formatData($output,$value,$str);
    
    echo $output;
?>