<?php
	if($_POST['team'] == 'IxD Grupp 5') {
		echo '{ "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pharetra leo nisi. Etiam luctus semper dolor ac dignissim. Aenean suscipit vehicula arcu, eget suscipit massa venenatis sit amet. Nulla non lorem id mauris feugiat dictum eget in nisl. ",
		"members": ["David Eriksson", "Martin Ohls", "Victor Carlsson", "Daniel Gunnarsson", "Viktor Swantesson"]}';	
	} else {
		echo '{}';
	}
?>