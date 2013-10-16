<?php
	$value = $_POST['value'];
	
	$str = '{"values":["apa","bosse"]}';
	
	$output = '{"value":""}';
	
	$json = json_decode($str);
	foreach($json->values as $item)
	{
    	if($item == $value) {
    		$output = '{"value":"'.apa.'"}';
   		}
	}
	echo $output;
	
?>