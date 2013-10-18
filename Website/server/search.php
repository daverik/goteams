<?php
	$value = $_POST['value'];
	
	$str = '{"values":["apa","apple","bosse"]}';
	
	$output = '{"values":[';
	
	if(strlen($value) > 0) {
		
	$pattern = '/'.$value.'/';
	
	$json = json_decode($str);
	foreach($json->values as $item)
	{
		preg_match($pattern, $item, $matches);
   		if(sizeof($matches) > 0) {
   			$output = $output.'"'.$item.'",';
   		}
	}
	$output = substr($output,0,strlen($output)-1).']}';
		echo $output;
	}
?>