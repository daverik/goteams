<?php

    session_start();
    $dbcnx = @mysql_connect("localhost", "root", "root");
 	
	// if not connected, login anyway (for testing purposes)
 	if (!$dbcnx) {
        echo '{ "loginSuccess": true }';
        exit();
    }
	
    $db_selected = mysql_select_db("lagvarvet", $dbcnx);

	if(!$db_selected) {
		echo '{ "loginSuccess": true }';
        exit();
	}
    $enteredUsername = $_POST['name'];

    $query = mysql_query("SELECT username FROM runner WHERE username = '$enteredUsername'");
    while ( $row = mysql_fetch_array($query) ) {
        $usrname = $row["username"];
    }

    if($_POST['name'] == $usrname) {
    	$_SESSION['username'] = $usrname;
        echo '{ "loginSuccess": true }';
    } else {
        echo '{ "loginSuccess": false }';
    }

?>