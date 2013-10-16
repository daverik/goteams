<?php
	session_start(); 
	$dbcnx = @mysql_connect("localhost", "root", "");

	mysql_select_db("lagvarvet", $dbcnx);

	if (!$dbcnx) {
		echo( "<P>Unable to connect to the " .
			  "database server at this time.</P>" );
		exit();
	}
	// Get user info from session variables
	$uName = $_SESSION['username'];

	$qPnr = mysql_query("SELECT pnr FROM runner WHERE username = '$uName'");
	while ($pnrRow = mysql_fetch_array($qPnr)) {
		$pnr = $pnrRow["pnr"];
	}

	$qTeam = mysql_query("SELECT teamtitle FROM teamsquad WHERE runnerpnr = '$pnr'");
	
	// Print the teams that the user is a member of.
	$str = '{ "teams": [';
	while ( $row = mysql_fetch_array($qTeam) ) {
		$team = $row["teamtitle"];
		$str .= '"'.$team.'",';
	}

	$str = substr($str,0,strlen($str)-1);

	echo $str.']}';
?>
