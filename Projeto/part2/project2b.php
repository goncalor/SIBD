<html>
	<head>
		<title>Transfer devices to the new PAN</title>
	</head>
	<body>

<?php
	include_once("credentials.php");
	// what the file should include:
	// $user = "istXXXXX";
	// $dbhost = "db.ist.utl.pt";
	// $dbpass ="XXXXXX";
	// $dbname = "ist173373";
	$dsn = "mysql:host=$dbhost;dbname=$dbname";

	try{
		$connection = new PDO($dsn, $user, $dbpass);
	}
	catch(PDOException $exception){
		echo("<p>Error: ");
		echo($exception->getMessage());
		echo("</p>");
		exit();
	}
	
	if(isset($_REQUEST['ID'])){ 
	
		$ID = $_REQUEST['ID'];
		
		$get_pans = "select end, pan from Wears, Patient 
				where Patient.number = Wears.patient 
				and number = $ID
				order by end desc limit 2";

		$result = $connection->query($get_pans);
	

		$current_pan = $result->fetch()['pan'];
		
		$previous_pan = $result->fetch();
		
		$previous_start = $previous_pan['start'];
		$previous_end = $previous_pan['end'];
		$previous_pan = $previous_pan['pan'];

		//echo("\n<tr><td>$previous_pan</td></tr>");
		//echo("\n<tr><td>$current_pan</td></tr>");
	
		$get_devices = "select start, end, snum, manuf, description 
					from Connects, Device 
					where snum = serialnum
					and manuf = manufacturer
					and pan = '$previous_pan'
					and '$previous_end' < '2099-01-01 00:00:00' 
					and end = '2099-01-01 00:00:00'";
					//pan não activa e device ainda ligado à pan
		
							
		$result = $connection->query($get_devices);
		if($result == False){
			echo("<p>Error: {$connection->errorInfo()[2]}/<p>");
		}

		echo("<form method='post' action=''>");
		echo("<p>Select devices to be transfered to the new PAN:</p>");		
		
		$i=0;
		foreach($result as $row){
			$devices[$i]['manufacturer'] = $row['manuf'];
			$devices[$i]['serialnum'] = $row['snum'];
			echo("<input type='checkbox' name='device[]' value='$i'/>$row[description] : $row[manuf] - $row[snum]</br>");
			$i++;
		}
		
		echo("<input type='submit' name='submit' value='submit' />");
		echo("</form>");
	}

	if(isset($_POST['submit'])){
		$selected_devices = $_REQUEST['device'];
			
		$now = date('Y-m-d H:i:s');
		$connection->query("insert into Period values ('$now', '2099-01-01 00:00:00')");
			
		foreach($selected_devices as $index){
			
			$manuf=$devices[$index]['manufacturer'];
			$sernum=$devices[$index]['serialnum'];
			
			$update = "update Connects set start='$now', pan='$current_pan' where manuf='$manuf' and snum='$sernum' and end='2099-01-01 00:00:00'";
			$result = $connection->query($update);
			if($result == False){
				echo("<p>Error: {$connection->errorInfo()[2]}/<p>");
			}

		}			
	}		

	$connection = null;	
?>					
	</body>
</html>




