<?php
	session_start();
    
    // Connect to db.
	$dbcnx = @mysql_connect("localhost", "root", "root");
    mysql_select_db("lagvarvet", $dbcnx);
    mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);
    
	$team = $_SESSION['team'];
	
    $qTeam = mysql_query("SELECT textpost, firstname, lastname, picture FROM feedpost INNER JOIN runner ON poster = pnr WHERE teamofpost = '$team'");
    $str = '{"posts": [{';
	
    // Get values, format to json.
    while($row = mysql_fetch_array($qTeam)) {
        $fname = $row["firstname"];
        $lname = $row["lastname"];
        $pic = $row["picture"];
        $text = $row["textpost"];
        
        $str .= '"name": "'.$fname.' '.$lname.'", ';
        $str .= '"avatar" : "'.$pic.'", ';
        $str .= '"text" : "'.$text.'"}, {';
    }
    $str = substr($str,0,strlen($str)-3);
	
	echo $str.']}';
?>