<?php
    // Gets data from the query and puts in a json formatted string.
    function getData ($dataColumn, $query, &$str) {
        while($row = mysql_fetch_array($query)) {
            $data = $row[$dataColumn];
            $str .= '"'.$data.'",';
        }
        $str = substr($str,0,strlen($str)-1);
        $str .= ']}';
    }
	
    // Runs the data through a regular expression that finds the data strings that begin the same as searched $value.
    function regExData (&$output, $value, $str) {
        $added = false;
        if(strlen($value) > 0) {
            $pattern = '/^'.$value.'/i';
            $json = json_decode($str);
       
            foreach($json->values as $item) {
                preg_match($pattern, $item, $matches);
                if(sizeof($matches) > 0) {
                    $output = $output.'"'.$item.'",';
                    $added = true;
                }
            }
        }
        if($added) {
            $output = substr($output,0,strlen($output)-1).']';   
        } else {
            $output .= ']'; 
        }
    }
    
    function getDataFirstName ($query, &$str) {
        while($row = mysql_fetch_array($query)) {
            $firstname = $row["firstname"];
            $lastname = $row["lastname"];
            $str .= '"'.$firstname.' '.$lastname.'",';
        }
        $str = substr($str,0,strlen($str)-1);
        $str .= ']}';
    }
     
    /*
    function regExDataLastName () {
        $added = false;
        if(strlen($value) > 0) {
            $pattern = '/^'.$value.'/i';
            $json = json_decode($str);
       
            foreach($json->values as $item) {
                preg_match($pattern, $item, $matches);
                if(sizeof($matches) > 0) {
                    $output = $output.'"'.$item.'",';
                    $added = true;
                }
            }
        }
        if($added) {
            $output = substr($output,0,strlen($output)-1).']';   
        } else {
            $output .= ']'; 
        }
    }*/
    
	$dbcnx = @mysql_connect("localhost", "root", "root");
    mysql_select_db("lagvarvet", $dbcnx);
    mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);
	
	$value = $_POST['value'];
    
    // Finds teams that fit the search.
    $qTeams = mysql_query("SELECT title FROM team");
    $str = '{"values":[';
    $output = '{"teams":[';
	getData("title", $qTeams, $str);
    regExData($output,$value,$str);
    
    // Finds leagues that fit the search.
    $qLeagues = mysql_query("SELECT title FROM league");
    $str = '{"values":[';
    $output .= ',"leagues":[';
    getData("title", $qLeagues, $str);
    regExData($output,$value,$str);
    
    // Finds runners (first name) that fit the search.
    $qName = mysql_query("SELECT firstname,lastname FROM runner");
    $str = '{"values":[';
    $output .= ',"names":[';
    getDataFirstName($qName, $str);
    regExData($output,$value,$str);
    /*
    // Finds runners (first name) that fit the search.
    $qLastName = mysql_query("SELECT lastname FROM runner");
    $str = '{"values":[';
    $output .= ',"lastnames":[';
    getData("lastname", $qLastName, $str);
    regExData($output,$value,$str);
    */
    echo $output.'}';
?>