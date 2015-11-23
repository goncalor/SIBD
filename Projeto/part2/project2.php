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
					$get_pans = "select end, pan from Wears, Patient 
										where Patient.number = Wears.patient 
										and name = '$name' 
										order by end asc";

					$result = $connection->query($get_pans);

					$previous_pan = $result->fetch()['pan'];
					$current_pan = $result->fetch()['pan'];
					
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

					$connection = null;
				}
			?>
	</body>
</html>

