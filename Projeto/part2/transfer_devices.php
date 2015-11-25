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

		<form method="post" action="transfer_devices.php">
			<p>Enter the patient's name:</p>
			<input type="text" name="name" />
			<input type="submit" name="submit" value="submit" />
		</form>


		<?php
			// find the patients 2 most recent PAN's
			if(isset($_POST['submit'])) {
				echo "<p>Patients with the submited name:</p>";			
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
				
				
				foreach($result as $row){
					  echo("<a href='transfer_devices2.php?ID=$row[0]'>$name : $row[0]</a></br>");
				}	
				
				$connection = null;
			}
		?>
	</body>
</html>

