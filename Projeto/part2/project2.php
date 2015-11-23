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

		<table border="1">
			<caption>Devices from the previews PAN</caption>
 			<tr>
				<td><em>PAN</em></td>
			</tr>

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

					echo("<input type='checkbox' name='branch_name' value='Brighton'/>test</br>");
					foreach($result as $row){
						echo("\n<tr>");
						for($j=0; $j < $result->columnCount(); $j++){
							echo("<td>{$row[$j]}</td>");
						}
						echo("</tr>");
						echo("<input type='checkbox' name='device' value='$row[manuf],$row[snum]'/>$row[manuf],$row[snum]</br>");
					}	

					$connection = null;
				}
			?>
		</table>
	</body>
</html>

