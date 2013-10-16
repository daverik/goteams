<?php
	session_start(); 
	
	$dbcnx = @mysql_connect("localhost", "root", "root");
	mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);
	
	mysql_select_db("lagvarvet", $dbcnx);

	if (!$dbcnx) {
		echo( "<P>Unable to connect to the " .
				  "database server at this time.</P>" );
		exit();
	}
	// Get user info from session vars.
	$uName = $_SESSION['username'];
	
	$qPnr = mysql_query("SELECT pnr FROM runner WHERE username = '$uName'");
	while ($pnrRow = mysql_fetch_array($qPnr)) {
		$pnr = $pnrRow["pnr"];
	}
	
	// Query the leagues.
	$qLeague = mysql_query("SELECT DISTINCT leaguetitle FROM teamsquad, leaguemembers WHERE teamsquad.runnerpnr = '$pnr' AND teamsquad.teamtitle = leaguemembers.teamtitle;");
		
	// Return the leagues that the user is a member of.
	$str = '{ "leagues": [';
	while ( $row = mysql_fetch_array($qLeague) ) {
		$league = $row["leaguetitle"];
		$str .= '"'.$league.'",';	
	}
	
	$str = substr($str,0,strlen($str)-1);
	
	echo $str.']}';
?>