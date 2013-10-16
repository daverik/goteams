<?php     
    $dbcnx = @mysql_connect("localhost", "root", "root");
    mysql_select_db("lagvarvet", $dbcnx);
    mysql_query ('SET NAMES UTF8;');
    mysql_query ('SET COLLATION_CONNECTION=utf8_general_ci;');
    mysql_client_encoding($dbcnx);
    
    $enteredLeague = $_POST['league'];
    
    $qDesc = mysql_query("SELECT leagueinfo FROM league WHERE '$enteredLeague' = title;");
    $description = mysql_result($qDesc, 0);

    $str = '{ "description": "'.$description.'",';
    
    // Query the teams in a league.
    $qLeagueMembers = mysql_query("SELECT teamtitle FROM leaguemembers WHERE '$enteredLeague' = leaguetitle;");
    
    $str .= '"teams": [';
    // Retrieve all the teams in the league.
    while($row = mysql_fetch_array($qLeagueMembers)) {
        $team = $row["teamtitle"];
        $str .= '"'.$team.'",';
    }
    $str = substr($str,0,strlen($str)-1);
  
    echo $str.']}';       
?>