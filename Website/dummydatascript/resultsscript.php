<?php    
    $dbcnx = @mysql_connect("localhost", "root", "root");
    mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);    
    
    $db_selected = mysql_select_db("lagvarvet", $dbcnx);
    
    $qPnr = mysql_query("SELECT pnr FROM runner");
    while ( $row = mysql_fetch_array($qPnr) ) {
        $pnr = $row["pnr"];
        $timeResult = rand(5400, 9000);
        $insert = "INSERT INTO result (checkpoint, timeresult, runnerpnr, points) VALUES ('5', '$timeResult', '$pnr', '0')";
        $ret = mysql_query($insert, $dbcnx);
    }
    if(!$ret) {
        echo "Could not insert dummy result data into database. Data already inserted?"; 
    } else {
        echo "Dummy result data from runners inserted into database!";
    }
?>