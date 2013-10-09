<?php
	
	if($_POST['name'] == '') {
		echo '{ "loginSuccess": true }';	
	} else {
		echo '{ "loginSuccess": false }';
	}
	
?>