<?php session_start(); ?>

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
			
			
			if($_REQUEST['ID'] != null){ 
			
				$ID = $_REQUEST['ID'];
			
				
				$get_pans = "select end, pan from Wears, Patient 
						where Patient.number = Wears.patient 
						and number = $ID
						order by end desc limit 2";

				$result = $connection->query($get_pans);
			
				$current_pan = $result->fetch()['pan'];
				$previous_pan = $result->fetch()['pan'];
				
				//echo("\n<tr><td>$previous_pan</td></tr>");
				//echo("\n<tr><td>$current_pan</td></tr>");
			
				$get_devices = "select start, end, snum, manuf, description 
							from Connects, Device 
							where snum = serialnum
							and manuf = manufacturer
							and pan = '$previous_pan'";

				
									
				$result = $connection->query($get_devices);
			}
			
		?>
			<form method="post" action="">
			  <p>Select devices to be transfered to the new PAN:</p>		
			
		<?php	
			if($result != null){
				$i=0;
				foreach($result as $row){
					$devices[$i]['manufacturer'] = $row['manuf'];
					$devices[$i]['serialnum'] = $row['snum'];
					echo("<input type='checkbox' name='device[]' value='$i'/>$row[description] : $row[manuf] - $row[snum]</br>");
					$i++;
				}
			}				
			
		?>
			
			  <input type="submit" name="submit" value="submit" />
			</form>

		<?php
		
			if(isset($_POST['submit'])){
			    $selected_devices = $_REQUEST['device'];
					
			    print_r($selected_devices);
			    
			    foreach($selected_devices as $device){
				
			    
			    
			    }			
			}		
		?>			
			
		<?php $connection = null; ?>
	</body>
</html>




