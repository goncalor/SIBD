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
		?>

		<form method="post" action="project2.php">
			<p>Enter the patient's name:</p>
			<input type="text" name="name" />
			<input type="submit" name="submit" value="submit" />
		</form>

			<p>Devices from the previous PAN. Select the ones you want to transfer:</p>			

			<?php
				// find the patients 2 most recent PAN's
				if(isset($_POST['submit'])) {
					try{
						$connection = new PDO($dsn, $user, $dbpass);
					}
					catch(PDOException $exception){
						echo("<p>Error: ");
						echo($exception->getMessage());
						echo("</p>");
						exit();
					}
					$name = $_POST['name'];
					
					$get_patients = "select number from Patient where name = '$name'";
					
					$result = $connection->query($get_patients);
					
					

					
					
					
					
					
					//create a form
					echo '<form action="project2.php" method="post">';
					// create dropdown; onchange will send the form when selected index changes...
					echo("<select id='patient_id' name='patient_id'>");
					echo("<option value='0'>--Select ID--</option>");
					
					foreach($result as $row){
					  echo("<option value='$row[0]'>$row[0]</option>");			
					}
					
					echo'</select>
					<input type="submit" name="submit_patient" value="submit" />
					</form>';
					
					
					if(isset($_POST['submit_patient'])) {
					  echo("TUJBHBUI");
					  echo($_REQUEST['patient_id']);
					}
					
					
					
					
					
					
					
					
					
					
					print_r($_REQUEST);
					
					if($_REQUEST->patient_id != null){ 
					  $get_pans = "select end, pan from Wears, Patient 
										  where Patient.number = Wears.patient 
										  and number = $_REQUEST->patient_id
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

					  foreach($result as $row){
						  echo("<input type='checkbox' name='device' value='$row[manuf],$row[snum]'/>$row[description] : $row[manuf] - $row[snum]</br>");
					  }	
					}
					$connection = null;
				}
			?>
	</body>
</html>

